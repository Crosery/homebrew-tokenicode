#!/usr/bin/env node

const fs = require("node:fs");
const path = require("node:path");

const REPO = "yiliqi78/TOKENICODE";
const CASK_PATH = path.join(__dirname, "..", "Casks", "tokenicode.rb");

async function fetchLatestRelease() {
  const response = await fetch(`https://api.github.com/repos/${REPO}/releases/latest`, {
    headers: {
      Accept: "application/vnd.github+json",
      "User-Agent": "homebrew-tokenicode-updater",
    },
  });

  if (!response.ok) {
    throw new Error(`GitHub API failed: ${response.status} ${response.statusText}`);
  }

  return response.json();
}

function shaFromAsset(asset) {
  if (!asset || typeof asset.digest !== "string") {
    return null;
  }

  const match = asset.digest.match(/^sha256:([0-9a-f]{64})$/i);
  return match ? match[1].toLowerCase() : null;
}

function findSha(release, version, arch) {
  const assetName = `TOKENICODE_${version}_${arch}.dmg`;
  const asset = release.assets.find((item) => item.name === assetName);
  const sha256 = shaFromAsset(asset);

  if (!sha256) {
    throw new Error(`Missing sha256 digest for asset: ${assetName}`);
  }

  return sha256;
}

function updateCask(content, version, armSha256, intelSha256) {
  let next = content;

  next = next.replace(/^  version ".*"$/m, `  version "${version}"`);
  next = next.replace(
    /  on_arm do\n    sha256 "[0-9a-f]{64}"\n  end/m,
    `  on_arm do\n    sha256 "${armSha256}"\n  end`,
  );
  next = next.replace(
    /  on_intel do\n    sha256 "[0-9a-f]{64}"\n  end/m,
    `  on_intel do\n    sha256 "${intelSha256}"\n  end`,
  );

  if (next === content) {
    return { changed: false, content: next };
  }

  return { changed: true, content: next };
}

async function main() {
  const release = await fetchLatestRelease();
  const version = release.tag_name.replace(/^v/, "");
  const armSha256 = findSha(release, version, "aarch64");
  const intelSha256 = findSha(release, version, "x64");
  const current = fs.readFileSync(CASK_PATH, "utf8");
  const result = updateCask(current, version, armSha256, intelSha256);

  fs.writeFileSync(CASK_PATH, result.content);

  console.log(`version=${version}`);
  console.log(`arm_sha256=${armSha256}`);
  console.log(`intel_sha256=${intelSha256}`);
  console.log(`changed=${result.changed}`);
}

main().catch((error) => {
  console.error(error.message);
  process.exit(1);
});

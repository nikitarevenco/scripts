const { execSync } = require("child_process");

const scoopPackageNames = execSync(`scoop list`)
  .toString()
  .split("\n")
  .slice(4, -3)
  .map((str) => str.match(/\S+\b/)[0]);

const scoopPackageData = scoopPackageNames
  .map((arg) => {
    const { homepage, description } = JSON.parse(
      execSync(`scoop cat ${arg}`).toString(),
    );

    return `| [${arg}](${homepage}) | ${description} |`;
  })
  .join("\n");

const mdTable = `| Package | Description | \n | - | - | \n ${scoopPackageData}`;

console.log(`
\`\`\`powershell
scoop install ${scoopPackageNames.join(" ")}
\`\`\`

${mdTable}`);

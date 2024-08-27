const { execSync } = require("child_process");

console.log(
  "7zip autohotkey bat clink diff-so-fancy duf eza fzf git gron lazygit neovim nodejs lua make pnpm python s sd go sharex wezterm zoxide nomino"
    .split(" ")
    .map((arg) => {
      const { homepage, description } = JSON.parse(
        execSync(`scoop cat ${arg}`).toString(),
      );

      return `| [${arg}](${homepage}) | ${description} | \n | - | - |`;
    }).join("\n"),
);

# How to Contribute to Misaka13514-AUR/repo

This project maintains an [unofficial Arch Linux user repository](https://wiki.archlinux.org/title/Unofficial_user_repositories), powered by [`lilac`](https://github.com/Misaka13514-AUR/lilac), with automation via GitHub Actions. If you would like to contribute packages or improvements, please follow the guidelines below.

## 🧙 For Package Maintainers

### 📦 Creating Arch Linux Packages

To maintain high package quality and keep consistency with the AUR, we prefer to **mirror AUR packages** whenever possible, unless there is a strong reason to deviate.

#### Create a Package from Scratch

When creating a new package:

- **Follow official Arch packaging standards**:
  - [Arch package guidelines](https://wiki.archlinux.org/title/Arch_package_guidelines)
  - [PKGBUILD documentation](https://wiki.archlinux.org/title/PKGBUILD)
- **Build packages in a clean chroot environment**:
  - Use [`extra-x86_64-build`](https://wiki.archlinux.org/title/DeveloperWiki:Building_in_a_clean_chroot) to ensure reproducibility and cleanliness.
- **Test your PKGBUILD with [`namcap`](https://wiki.archlinux.org/title/Namcap)**:
  - Run it on both the PKGBUILD and the generated package file.
  - Fix packaging issues accordingly.

#### Copy a Package from AUR

If you're bringing an existing AUR package into this repository:

- **Ensure the AUR package is actively maintained and follows Arch packaging standards**.
  - If the package violates packaging rules, please contact the AUR maintainer and suggest fixes upstream before introducing it here.
- **Preserve Git history when importing**:
  - Use `git subtree` to merge the full Git history from the AUR.
  - A modified version of [`aurpublish`](https://github.com/eli-schwartz/aurpublish) may help automate this process.
- **Handle dependencies properly**:
  - If the package depends on other AUR packages, ensure those dependencies are also added to this repository.
  - Declare the relationship clearly in the `lilac.yaml` config so they are built in the correct order.

### ⚙️ Configuration Specific to This Repository

#### Lilac-based Automation

This repository is managed by [lilac](https://github.com/Misaka13514-AUR/lilac), a bot for automating package building and version bumping.

- Package build automation is defined in a `lilac.yaml` file inside each package directory.
  - [`lilac.yaml` documentation](https://lilac.readthedocs.io/en/latest/_modules/lilac2/api.html)
- Version tracking is done via [`nvchecker`](https://nvchecker.readthedocs.io/en/latest/usage.html#configuration-files).
- Most packages update automatically; manual commits should not be made for version bumps.

Here are two example configurations for `lilac.yaml`:

##### 1. Tracking AUR only (no push to AUR, passive mirror):

This configuration is for packages that we do not maintain in AUR:

```yaml
maintainers:
  - github: Misaka13514-AUR
    email: aur@apeiria.net

build_prefix: extra-x86_64

pre_build_script: aur_pre_build(maintainers=['maintainer1', 'maintainer2'])

post_build: aur_post_build

update_on:
  - source: aur
    aur: package_name
```

##### 2. Actively maintained and updated (with AUR pushback):

This configuration is for packages that we maintain on AUR and want to push updates back:

```yaml
maintainers:
  - github: your-github-username
    email: your-email

build_prefix: extra-x86_64

pre_build_script: |
  aur_pre_build(maintainers=['maintainer1', 'maintainer2'])
  update_pkgver_and_pkgrel(_G.newver)

post_build_script: |
  aur_post_build()
  update_aur_repo()

update_on:
  - source: nvchecker
    additional_nvchecker_config: please_change
```

### 🔍 Additional Repository Rules and Workflow

- Ensure `pre-commit` hooks pass before committing.
- Do **not** commit `.SRCINFO` or `.gitignore` to this repository.

---

## 🧙 For Developer

### ⚙️ CI Workflow and GitHub Actions

This repository uses GitHub Actions for automated building and testing:

- Workflow YAML files are located under `.github/workflows/`.
- `lilac` runs inside a Docker container; the configuration is found under `docker/`.
- The build system requires proper support for **systemd** and **cgroup v2** inside the container environment.
  - Make your own fork of this repository to debug the workflow. You can remove every package except `lilac` and its dependencies to speed up the debugging process.
  - [action-tmate](https://github.com/mxschmitt/action-tmate) can be used to debug the workflow interactively.

### 🌐 Hosting and Mirroring the Repository Website

Except for PKGBUILDs, workflow scripts, and Dockerfiles, all other code can be found in the [Misaka13514-AUR](https://github.com/Misaka13514-AUR) organization.

Before making changes, please ensure you have read the architecture diagram in [README.md](https://github.com/Misaka13514-AUR/repo/blob/main/README.md#architecture) to understand how the repository is structured.

All packages and logs are hosted on public infrastructure (OneDrive, Cloudflare, etc.). You can create a mirror of this repository using [`rclone`](https://rclone.org).

If you are hosting a public mirror, feel free to open a PR to have it listed in the documentation.

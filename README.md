# #!/.files

## Usage

Most operations are powered by [`make`](https://www.gnu.org/software/make/manual/make.html). Try running `make help`!

To review what each target does, run `make -n <target>`.

### Installation

```shell
mkdir -p $HOME/Repos
git clone https://github.com/bsander/dotfiles.git $HOME/Repos/dotfiles
cd $HOME/Repos/dotfiles
PROJECTS=.. make install
```

### Decrypting sensitive files
1. Make sure [git-crypt](https://github.com/AGWA/git-crypt) is installed
2. Locate the decryption certificate
3. ```shell
   git crypt unlock /path/to/key
	 ```

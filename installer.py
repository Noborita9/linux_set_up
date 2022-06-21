from os import listdir
from os.path import isfile, join

def vim_install():
    if os.path.exists('~/.vimrc') == False:
        os.system('ln ./vim_related/.vimrc ~/.vimrc')
        print(".vimrc installed")
    else:
        print(".vimrc already exists")


def main():
    path = './installs'
    files = [f for f in listdir(path) if isfile(join(path, f))]
    vim_install()


if __name__ == "__main__":
    main()


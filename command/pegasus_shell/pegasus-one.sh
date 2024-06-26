#!/bin/sh
# Name : Pegasus
# Pegasus One is a hacking tools installer and package manager for hacker's.
# Credit : pxcs && sobri3159

logo="
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⠴⠂⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣴⣲⢶⣿⣿⣿⣶⢠⣤⣒⣒⣟⣿⣿⣟⣺⠯⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⡸⣻⣿⣿⡿⢺⣿⠯⢤⠬⢭⣽⣟⣍⣀⣀⣀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⣴⣿⣿⣿⢤⣯⣿⢟⣽⢟⡵⢿⠷⢚⣛⣯⣽⡿⠍⠉
⠀⠀⠀⠀⠀⠀⠀⠀⠟⣸⣿⣿⣿⡥⣪⣿⢯⣾⣣⣚⣛⣋⣩⠭⠧⠒⠂⠀⠀⠀
⠀⠀⠀⠀⢀⡀⠀⢰⣿⣿⣿⣿⣿⣿⣭⣵⣿⣵⣾⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣠⣽⣻⣷⣜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠙⢳⣶⣦⣤⣀⠀⠀
⠀⢀⡼⠁⠈⣏⠉⠙⠛⠑⠻⠿⠿⠿⠿⠿⠛⠙⢿⣿⣿⣾⡄⠀⠁⠙⢿⣿⣧⠀
⣠⠛⠀⠀⠀⠈⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣷⣃⠀⠀⠈⠉⠁⠀
⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⣇⡀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣟⠂⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠇⠀⠀⠀
"
prompt="\007\033[00m[\033[01;34mpegasus-one\033[00m@\033[01;34mspace\033[00m]$"

# checking for system home dir
if [ -d $HOME ]; then
  home=$HOME
else
  home="~/"
fi

# checking for system bin dir
if [ -d /data/data/com.termux/files/usr/bin ]; then
  bin="/data/data/com.termux/files/usr/bin"
elif [ -d /usr/local/bin ]; then
  bin="/usr/local/bin"
elif [ -d /bin ]; then
  bin="/bin"
elif [ -d /sbin ]; then
  bin="/sbin"
fi

# checking for configuration dir
if [ -d /data/data/com.termux/files/usr/etc ]; then
  conf_dir="/data/data/com.termux/files/usr/etc"
elif [ -d /etc ]; then
  conf_dir="/etc"
fi

# configuration files
if [ -d $conf_dir/pegasus-one ]; then
  if [ -e $conf_dir/pegasus-one/data/tools.dat ]; then
    tools_data="$conf_dir/pegasus-one/data/tools.dat"
  fi
  if [ -e $conf_dir/pegasus-one/data/category.dat ]; then
    category_data="$conf_dir/pegasus-one/data/category.dat"
  fi
else
  if [ -e data/tools.dat ]; then
    tools_data="data/tools.dat"
  fi
  if [ -e data/category.dat ]; then
    category_data="data/category.dat"
  fi
fi

# checking for system root access
if [ -e /usr/lib/sudo ]; then
  sudo="sudo"
elif [ -e /usr/bin/sudo ]; then
  sudo="sudo"
elif [ -e /usr/sbin/sudo ]; then
  sudo="sudo"
elif [ -e /lib/sudo ]; then
  sudo="sudo"
elif [ -e /bin/sudo ]; then
  sudo="sudo"
elif [ -e /sbin/sudo ]; then
  sudo="sudo"
elif [ -e /data/data/com.termux/files/usr/bin/sudo ]; then
  sudo="sudo"
else
  sudo=""
fi

# checking for system package manager
if [ -e /bin/apt ]; then
  pac="apt-get"
  system="linux"
elif [ -e /bin/apt-get ]; then
  pac="apt-get"
  system="linux"
elif [ -e /usr/bin/apt-get ]; then
  pac="apt-get"
  system="linux"
elif [ -e /sbin/apt-get ]; then
  pac="apt-get"
  system="linux"
elif [ -e /usr/sbin/apt-get ]; then
  pac="apt-get"
  system="linux"
elif [ -e /bin/apk ]; then
  pac="apk"
  system="linux"
elif [ -e /usr/bin/apk ]; then
  pac="apk"
  system="linux"
elif [ -e /sbin/apk ]; then
  pac="apk"
  system="linux"
elif [ -e /usr/sbin/apk ]; then
  pac="apk"
  system="linux"
elif [ -e /bin/yum ]; then
  pac="yum"
  system="fedora"
elif [ -e /usr/bin/yum ]; then
  pac="yum"
  system="fedora"
elif [ -e /sbin/yum ]; then
  pac="yum"
  system="fedora"
elif [ -e /usr/sbin/yum ]; then
  pac="yum"
  system="fedora"
elif [ -e /usr/local/bin/brew ]; then
  pac="brew"
  system="mac"
  sudo=""
elif [ -e /data/data/com.termux/files/usr/bin/pkg ]; then
  pac="pkg"
  system="termux"
elif [ -e /data/data/com.termux/files/usr/bin/apt ]; then
  pac="apt"
  system="termux"
elif [ -e /data/data/com.termux/files/usr/bin/apt-get ]; then
  pac="apt-get"
  system="termux"
fi

# install tools
install() {
  # get tool alias name
  tool_name=`grep '.' $tools_data | sort -f | sed -n "$1p" | cut -d"|" -f1`
  # get tool package manager
  tool_installer=`grep '.' $tools_data | sort -f | sed -n "$1p" | cut -d"|" -f5`
  # tool dependency (requirements)
  tool_dependency=`grep '.' $tools_data | sort -f | sed -n "$1p" | cut -d"|" -f6 | tr ' ' ','`
  # tool url
  tool_url=`grep '.' $tools_data | sort -f | sed -n "$1p" | cut -d"|" -f4`
  # package name or tool name
  tool_pac=`grep '.' $tools_data | sort -f | sed -n "$1p" | cut -d"|" -f2`
  # check tool name is null or not
  if [ "$tool_name" ]; then

    # for default package
    if [ $tool_installer = "package_manager" ]; then
      # check tool is already installed or not
      if [ ! -e $bin/$tool_pac ]; then
        # check sudo is null or not
        if [ $sudo ]; then
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $sudo $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_pac != "" -a $tool_pac != "null" ]; then
              $sudo $pac install $tool_pac -y
            fi
          else
            echo "\033[01;31mSorry you are offline !!\033[00m"
          fi
        else
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_pac != "" -a $tool_pac != "null" ]; then
              $pac install $tool_pac -y
            fi
          else
            echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          fi
        fi
        # check tool is installed or not
        if [ ! -e $bin/$tool_pac ]; then
          echo "\033[01;31mSorry \033[00m: '$tool_name' \033[01;31mis not installed !!\033[00m"
        else
          echo "\033[00m'$tool_name' \033[00m: \033[01;32mis installed successfully !!\033[00m"
        fi
      else
        echo "\033[01;31mSorry \033[00m: \033[00m'$tool_name' \033[01;32mis already installed !!\033[00m"
      fi

    # for github tools
    elif [ $tool_installer = "git" ]; then
      # check tool is already installed or not
      if [ ! -e ~/$tool_pac ]; then
        # check sudo is null or not
        if [ $sudo ]; then
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $sudo $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              $sudo git clone $tool_url ~/$tool_name
            fi
          else
            echo "\033[01;31mSorry you are offline !!\033[00m"
          fi
        else
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              git clone $tool_url ~/$tool_name
            fi
          else
            echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          fi
        fi
        # check tool is installed or not
        if [ ! -e ~/$tool_pac ]; then
          echo "\033[01;31mSorry \033[00m: '$tool_name' \033[01;31mis not installed !!\033[00m"
        else
          echo "\033[00m'$tool_name' \033[00m: \033[01;32mis installed successfully !!\033[00m"
        fi
      else
        echo "\033[01;31mSorry \033[00m: \033[00m'$tool_name' \033[01;32mis already installed !!\033[00m"
      fi

    # for curl tools
    elif [ $tool_installer = "curl" ]; then
      # check tool is already installed or not
      if [ ! -e ~/$tool_pac ]; then
        # check sudo is null or not
        if [ $sudo ]; then
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $sudo $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              $sudo curl -o ~/$tool_pac $tool_url
            fi
          else
            echo "\033[01;31mSorry you are offline !!\033[00m"
          fi
        else
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              curl -o ~/$tool_pac $tool_url
            fi
          else
            echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          fi
        fi
        # check tool is installed or not
        if [ ! -e ~/$tool_pac ]; then
          echo "\033[01;31mSorry \033[00m: '$tool_name' \033[01;31mis not installed !!\033[00m"
        else
          echo "\033[00m'$tool_name' \033[00m: \033[01;32mis installed successfully !!\033[00m"
        fi
      else
        echo "\033[01;31mSorry \033[00m: \033[00m'$tool_name' \033[01;32mis already installed !!\033[00m"
      fi

    # for wget tools
    elif [ $tool_installer = "wget" ]; then
      # check tool is already installed or not
      if [ ! -e ~/$tool_pac ]; then
        # check sudo is null or not
        if [ $sudo ]; then
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $sudo $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              $sudo wget $tool_url -o ~/$tool_pac
            fi
          else
            echo "\033[01;31mSorry you are offline !!\033[00m"
          fi
        else
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              wget $tool_url -o ~/$tool_pac
            fi
          else
            echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          fi
        fi
        # check tool is installed or not
        if [ ! -e ~/$tool_pac ]; then
          echo "\033[01;31mSorry \033[00m: '$tool_name' \033[01;31mis not installed !!\033[00m"
        else
          echo "\033[00m'$tool_name' \033[00m: \033[01;32mis installed successfully !!\033[00m"
        fi
      else
        echo "\033[01;31mSorry \033[00m: \033[00m'$tool_name' \033[01;32mis already installed !!\033[00m"
      fi
    # for any new installer
    # put here
    fi
  fi
  # wait for user any input
  echo -n "$prompt "
  read tmp_inp
}

# install category tools
install_category_tool() {
  # get tool alias name
  tool_name=`grep '.' $tools_data | sort -f | sed -n "/$1/p" | sed -n "$2 p" | cut -d"|" -f1`
  # get tools package manager
  tool_installer=`grep '.' $tools_data | sort -f | sed -n "/$1/p" | sed -n "$2 p" | cut -d"|" -f5`
  # tool dependency (requirements)
  tool_dependency=`grep '.' $tools_data | sort -f | sed -n "/$1/p" | sed -n "$2 p" | cut -d"|" -f6 | tr ' ' ','`
  # tool url
  tool_url=`grep '.' $tools_data | sort -f | sed -n "/$1/p" | sed -n "$2 p" | cut -d"|" -f4`
  # package name or tool name
  tool_pac=`grep '.' $tools_data | sort -f | sed -n "/$1/p" | sed -n "$2 p" | cut -d"|" -f2`
  # check tool name is null or not
  if [ "$tool_name" ]; then

    # for default package
    if [ $tool_installer = "package_manager" ]; then
      # check tool is already installed or not
      if [ ! -e $bin/$tool_pac ]; then
        # check sudo is null or not
        if [ $sudo ]; then
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $sudo $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_pac != "" -a $tool_pac != "null" ]; then
              $sudo $pac install $tool_pac -y
            fi
          else
            echo "\033[01;31mSorry you are offline !!\033[00m"
          fi
        else
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_pac != "" -a $tool_pac != "null" ]; then
              $pac install $tool_pac -y
            fi
          else
            echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          fi
        fi
        # check tool is installed or not
        if [ ! -e $bin/$tool_pac ]; then
          echo "\033[01;31mSorry \033[00m: '$tool_name' \033[01;31mis not installed !!\033[00m"
        else
          echo "\033[00m'$tool_name' \033[00m: \033[01;32mis installed successfully !!\033[00m"
        fi
      else
        echo "\033[01;31mSorry \033[00m: \033[00m'$tool_name' \033[01;32mis already installed !!\033[00m"
      fi

    # for github tools
    elif [ $tool_installer = "git" ]; then
      # check tool is already installed or not
      if [ ! -e ~/$tool_pac ]; then
        # check sudo is null or not
        if [ $sudo ]; then
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $sudo $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              $sudo git clone $tool_url ~/$tool_pac
            fi
          else
            echo "\033[01;31mSorry you are offline !!\033[00m"
          fi
        else
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              git clone $tool_url ~/$tool_pac
            fi
          else
            echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          fi
        fi
        # check tool is installed or not
        if [ ! -e ~/$tool_pac ]; then
          echo "\033[01;31mSorry \033[00m: '$tool_name' \033[01;31mis not installed !!\033[00m"
        else
          echo "\033[00m'$tool_name' \033[00m: \033[01;32mis installed successfully !!\033[00m"
        fi
      else
        echo "\033[01;31mSorry \033[00m: \033[00m'$tool_name' \033[01;32mis already installed !!\033[00m"
      fi

    # for curl tools
    elif [ $tool_installer = "curl" ]; then
      # check tool is already installed or not
      if [ ! -e ~/$tool_pac ]; then
        # check sudo is null or not
        if [ $sudo ]; then
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $sudo $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              $sudo curl -o ~/$tool_pac $tool_url
            fi
          else
            echo "\033[01;31mSorry you are offline !!\033[00m"
          fi
        else
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              curl -o ~/$tool_pac $tool_url
            fi
          else
            echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          fi
        fi
        # check tool is installed or not
        if [ ! -e ~/$tool_pac ]; then
          echo "\033[01;31mSorry \033[00m: '$tool_name' \033[01;31mis not installed !!\033[00m"
        else
          echo "\033[00m'$tool_name' \033[00m: \033[01;32mis installed successfully !!\033[00m"
        fi
      else
        echo "\033[01;31mSorry \033[00m: \033[00m'$tool_name' \033[01;32mis already installed !!\033[00m"
      fi

    # for wget tools
    elif [ $tool_installer = "wget" ]; then
      # check tool is already installed or not
      if [ ! -e ~/$tool_pac ]; then
        # check sudo is null or not
        if [ $sudo ]; then
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $sudo $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              $sudo wget $tool_url -o ~/$tool_pac
            fi
          else
            echo "\033[01;31mSorry you are offline !!\033[00m"
          fi
        else
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              wget $tool_url -o ~/$tool_pac
            fi
          else
            echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          fi
        fi
        # check tool is installed or not
        if [ ! -e ~/$tool_pac ]; then
          echo "\033[01;31mSorry \033[00m: '$tool_name' \033[01;31mis not installed !!\033[00m"
        else
          echo "\033[00m'$tool_name' \033[00m: \033[01;32mis installed successfully !!\033[00m"
        fi
      else
        echo "\033[01;31mSorry \033[00m: \033[00m'$tool_name' \033[01;32mis already installed !!\033[00m"
      fi
    # for any new installer
    # put here
    fi
  fi
  # wait for user any input
  echo -n "$prompt "
  read tmp_inp
}

# list all tools from data
all_tools() {
  while true; do
    clear
    # get all tools data
    echo " \033[01;31m___
//___// \033[01;33mAll Tools
"
    for data in `grep "." $tools_data | sort -f | grep -n '.' | sed -n 's/:/|/p' | cut -d"|" -f1,2 | tr ' ' '@'`; do
      # display tools name from data
      for tool in $data; do
        echo " \033[01;32m$tool" | tr '|' ' ' | tr '@' ' '
      done
    done
    echo " \033[01;32m0 Back"
    echo -n "$prompt "
    read cmd
    # count total number of tools
    list=`grep -n "." $tools_data | wc -l`
    # process user input
    case $cmd in
      [1-9]|[1-9][0-9]|[1-9][0-9][0-9]|[1-9][0-9][0-9])
        if [ $cmd -le $list ]; then
          # install tools
          install $cmd
        else
          echo "\007\033[00m'$cmd': \033[01;31minvalid option!!"
          sleep 1
        fi
      ;;
      0|back|Back)
        break
      ;;
      *)
        echo "\007\033[00m'$cmd': \033[01;31minvalid option!!"
        sleep 1
      ;;
    esac
  done
}

# category function
category() {
  while true; do
    clear
    # get all category data
    echo " \033[01;31m___
//___// \033[01;33mTool Category
"
    for data in `grep "." $category_data | grep -n '.' | sed -n 's/:/|/p' | cut -d"|" -f1,2 | tr ' ' '@'`; do
      # display category alias name from data
      for category in $data; do
        echo " \033[01;32m$category" | tr '|' ' ' | tr '@' ' '
      done
    done
    echo " \033[01;32m0 Back"
    echo -n "$prompt "
    read cmd
    # count total number of category
    list=`grep -n "." $category_data | wc -l`
    # process user input
    case $cmd in
      [1-9]|[1-9][0-9])
        if [ $cmd -le $list ]; then
          while [ true ]; do
            clear
            # display all tools of selected category
            category=`grep '.' $category_data | sed -n "$cmd p" | cut -d"|" -f2`
            category_alias=`grep '.' $category_data | sed -n "$cmd p" | cut -d"|" -f1`
            # get all tools data and display
            echo " \033[01;31m___
//___// \033[01;33m$category_alias
"
            for data in `grep "." $tools_data | sort -f | sed -n "/$category/p" | grep -n '.' | sed -n 's/:/|/p' | cut -d"|" -f1,2 | tr ' ' '@'`; do
              # display tools name from data
              for tool in $data; do
                echo " \033[01;32m$tool" | tr '|' ' ' | tr '@' ' '
              done
            done
            echo " \033[01;32m0 Back"
            echo -n "$prompt "
            read tmp_cmd
            # count total number of tools in category
            list=`grep -n "." $tools_data | sed -n "/$category/p" | wc -l`
            # process user input
            case $tmp_cmd in
              [1-9]|[1-9][0-9]|[1-9][0-9][0-9]|[1-9][0-9][0-9])
                if [ $tmp_cmd -le $list ]; then
                  # install tools
                  install_category_tool $category $tmp_cmd
                else
                  echo "\007\033[00m'$tmp_cmd': \033[01;31minvalid option!!"
                  sleep 1
                fi
              ;;
                0|back|Back)
                break
              ;;
              *)
                echo "\007\033[00m'$tmp_cmd': \033[01;31minvalid option!!"
                sleep 1
              ;;
            esac
          done
        else
          echo "\007\033[00m'$cmd': \033[01;31minvalid option!!"
          sleep 1
        fi
      ;;
      0|back|Back)
        break
      ;;
      *)
        echo "\007\033[00m'$cmd': \033[01;31minvalid option!!"
        sleep 1
      ;;
    esac
  done
}

# update pegasus-one function
update() {
  while true; do
    clear
    echo "$logo"
    echo " \033[00m[1] \033[01;32mUpdate\033[00m"
    echo " \033[00m[0] \033[01;32mBack"
    echo -n "$prompt "
    read cmd
    case $cmd in
      1)
        # check user is online or not
        wget -q --spider http://google.com
        if [ $? -eq 0 ]; then
          echo "\033[01;32mUpdating ...\033[00m"
          sleep 1
          if [ -e $bin/git ]; then
            if [ $sudo ]; then
              $sudo git clone https://github.com/rajkumardusad/pegasus-one.git ~/pegasus-one
              $sudo chmod +x ~/pegasus-one/install
              $sudo sh ~/pegasus-one/install
            else
              git clone https://github.com/rajkumardusad/pegasus-one.git ~/pegasus-one
              chmod +x ~/pegasus-one/install
              sh ~/pegasus-one/install
            fi
          else
            if [ $sudo ]; then
              $sudo $pac install git -y
              $sudo git clone https://github.com/rajkumardusad/pegasus-one.git ~/pegasus-one
              $sudo chmod +x ~/pegasus-one/install
              $sudo sh ~/pegasus-one/install
            else
              $pac install git -y
              git clone https://github.com/rajkumardusad/pegasus-one.git ~/pegasus-one
              chmod +x ~/pegasus-one/install
              sh ~/pegasus-one/install
            fi
          fi
          echo "\007\033[01;32mpegasus-one updated !!\033[00m"
          sleep 1
        else
          echo "\007\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          sleep 1
        fi
      ;;
      0)
        break
      ;;
      *)
        echo "\007\033[00m'$cmd': \033[01;31minvalid option!!"
        sleep 1
      ;;
    esac
  done
}

# about pegasus-one function
about() {
  clear
  echo "$logo"
  echo " \033[01;33mpegasus-one \033[01;31mv0.1\033[00m"
  echo " pegasus-one is a library of all"
  echo " hakcing tools for termux"
  echo " and other linux distribution."
  echo -n "$prompt "
  read tmp
}

# this is the main function
menu() {
  while true; do
    clear
    tools=`grep -n '.' $tools_data | wc -l`
    echo "$logo"
    echo " \033[00m[1] \033[01;32mAll tools \033[00m(\033[01;31m$tools tools\033[00m)"
    echo " \033[00m[2] \033[01;32mTools category"
    echo " \033[00m[3] \033[01;32mUpdate pegasus-one"
    echo " \033[00m[4] \033[01;32mAbout us"
    echo " \033[00m[5] \033[01;32mExit"
    echo -n "$prompt "
    read cmd
    case $cmd in
      1)
        all_tools
      ;;
      2)
        category
      ;;
      3)
        update
      ;;
      4)
        about
      ;;
      5|exit|Exit)
        echo "\007\033[01;32mExiting ....\033[00m"
        break
      ;;
      *)
        echo "\007\033[00m'$cmd': \033[01;31minvalid option!!\033[00m"
        sleep 1
      ;;
    esac
  done
}


# list all tools from data
cli_list_all() {
  # get all tools data
  tool=`grep "." $tools_data | sort -f | grep -n '.' | sed -n 's/:/|/p' | cut -d"|" -f1,2 | tr '|' ' '`
  # display tools name from data
  echo "\033[01;32m$tool\033[00m"
}

# comming soon
# category function
cli_category() {
  # get all category data
  for data in `grep "." $category_data | grep -n '.' | sed -n 's/:/|/p' | cut -d"|" -f1,2 | tr ' ' '@'`; do
    # display category alias name from data
    for category in $data; do
      echo " \033[01;32m$category\033[00m" | tr '|' ' ' | tr '@' ' '
    done
  done
}

# update process
update_process() {
  # check file is downloaded or not
  if [ -e $home/pegasus-one/pegasus-one ]; then
    # removing old one
    if [ -e $bin/pegasus-one ]; then
      if [ -d $conf_dir/pegasus-one ]; then
        if [ $sudo ]; then
          $sudo rm -rf $bin/pegasus-one
          $sudo rm -rf $conf_dir/pegasus-one
        else
          rm -rf $bin/pegasus-one
          rm -rf $conf_dir/pegasus-one
        fi
      fi
    fi
  fi

  # updating pegasus-one
  if [ -e $home/pegasus-one/pegasus-one ]; then
    if [ $sudo ]; then
      $sudo mv -v $home/pegasus-one/pegasus-one $bin
      $sudo chmod +x $bin/pegasus-one
    else
      mv -v $home/pegasus-one/pegasus-one $bin
      chmod +x $bin/pegasus-one
    fi
  fi
  if [ -d $home/pegasus-one ]; then
    if [ $sudo ]; then
    $sudo mv -v $home/pegasus-one $conf_dir
    else
      mv -v $home/pegasus-one $conf_dir
    fi
  fi
}

# update pegasus-one function
cli_update() {
  # check user is online or not
  wget -q --spider http://google.com
  if [ $? -eq 0 ]; then
    echo "\033[01;32mUpdating ...\033[00m"
    sleep 1
    if [ -e $bin/git ]; then
      if [ $sudo ]; then
        $sudo git clone https://github.com/rajkumardusad/pegasus-one.git ~/pegasus-one
        update_process
      else
        git clone https://github.com/rajkumardusad/pegasus-one.git ~/pegasus-one
        update_process
       fi
    else
      if [ $sudo ]; then
        $sudo $pac install git -y
        $sudo git clone https://github.com/rajkumardusad/pegasus-one.git ~/pegasus-one
        update_process
      else
        $pac install git -y
        git clone https://github.com/rajkumardusad/pegasus-one.git ~/pegasus-one
        update_process
      fi
    fi
    echo "\033[00m'pegasus-one' \033[01;32mupdated successfully !!\033[00m"
  else
    echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
  fi
}

# cli install process
install_process() {
  # get tool alias name
  tool_name=`echo $1 | cut -d"|" -f1`
  # get tool package manager
  tool_installer=`echo $1 | cut -d"|" -f5`
  # tool dependency (requirements)
  tool_dependency=`echo $1 | cut -d"|" -f6 | tr ' ' ','`
  # tool url
  tool_url=`echo $1 | cut -d"|" -f4`
  # package name or tool name
  tool_pac=`echo $1 | cut -d"|" -f2`

  # check tool name is null or not
  if [ "$tool_name" ]; then

    # for default package
    if [ $tool_installer = "package_manager" ]; then
      # check tool is already installed or not
      if [ ! -e $bin/$tool_pac ]; then
        # check sudo is null or not
        if [ $sudo ]; then
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $sudo $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_pac != "" -a $tool_pac != "null" ]; then
              $sudo $pac install $tool_pac -y
            fi
          else
            echo "\033[01;31mSorry you are offline !!\033[00m"
          fi
        else
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_pac != "" -a $tool_pac != "null" ]; then
              $pac install $tool_pac -y
            fi
          else
            echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          fi
        fi
        # check tool is installed or not
        if [ ! -e $bin/$tool_pac ]; then
          echo "\033[01;31mSorry \033[00m: '$tool_name' \033[01;31mis not installed !!\033[00m"
        else
          echo "\033[00m'$tool_name' \033[00m: \033[01;32mis installed successfully !!\033[00m"
        fi
      else
        echo "\033[01;31mSorry \033[00m: \033[00m'$tool_name' \033[01;32mis already installed !!\033[00m"
      fi

    # for github tools
    elif [ $tool_installer = "git" ]; then
      # check tool is already installed or not
      if [ ! -e ~/$tool_pac ]; then
        # check sudo is null or not
        if [ $sudo ]; then
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $sudo $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              $sudo git clone $tool_url ~/$tool_name
            fi
          else
            echo "\033[01;31mSorry you are offline !!\033[00m"
          fi
        else
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              git clone $tool_url ~/$tool_name
            fi
          else
            echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          fi
        fi
        # check tool is installed or not
        if [ ! -e ~/$tool_pac ]; then
          echo "\033[01;31mSorry \033[00m: '$tool_name' \033[01;31mis not installed !!\033[00m"
        else
          echo "\033[00m'$tool_name' \033[00m: \033[01;32mis installed successfully !!\033[00m"
        fi
      else
        echo "\033[01;31mSorry \033[00m: \033[00m'$tool_name' \033[01;32mis already installed !!\033[00m"
      fi

    # for curl tools
    elif [ $tool_installer = "curl" ]; then
      # check tool is already installed or not
      if [ ! -e ~/$tool_pac ]; then
        # check sudo is null or not
        if [ $sudo ]; then
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $sudo $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              $sudo curl -o ~/$tool_pac $tool_url
            fi
          else
            echo "\033[01;31mSorry you are offline !!\033[00m"
          fi
        else
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              curl -o ~/$tool_pac $tool_url
            fi
          else
            echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          fi
        fi
        # check tool is installed or not
        if [ ! -e ~/$tool_pac ]; then
          echo "\033[01;31mSorry \033[00m: '$tool_name' \033[01;31mis not installed !!\033[00m"
        else
          echo "\033[00m'$tool_name' \033[00m: \033[01;32mis installed successfully !!\033[00m"
        fi
      else
        echo "\033[01;31mSorry \033[00m: \033[00m'$tool_name' \033[01;32mis already installed !!\033[00m"
      fi

    # for wget tools
    elif [ $tool_installer = "wget" ]; then
      # check tool is already installed or not
      if [ ! -e ~/$tool_pac ]; then
        # check sudo is null or not
        if [ $sudo ]; then
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            # install tool dependency
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $sudo $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              $sudo wget $tool_url -o ~/$tool_pac
            fi
          else
            echo "\033[01;31mSorry you are offline !!\033[00m"
          fi
        else
          #check user is online or not
          wget -q --spider http://google.com
          if [ $? -eq 0 ]; then
            echo "\033[01;32mInstalling ...\033[00m"
            sleep 1
            # install tool dependency
            if [ $tool_dependency != "null" ]; then
              for dep_name in `echo $tool_dependency | tr ',' ' '`; do
                # installing dependency
                if [ ! -e $bin/$dep_name ]; then
                  $pac install $dep_name -y
                fi
              done
            fi
            # installing tools
            if [ $tool_url != "" -a $tool_url != "null" ]; then
              wget $tool_url -o ~/$tool_pac
            fi
          else
            echo "\033[01;31mSorry \033[00m: you are \033[01;31moffline \033[00m!!\033[00m"
          fi
        fi
        # check tool is installed or not
        if [ ! -e ~/$tool_pac ]; then
          echo "\033[01;31mSorry \033[00m: '$tool_name' \033[01;31mis not installed !!\033[00m"
        else
          echo "\033[00m'$tool_name' \033[00m: \033[01;32mis installed successfully !!\033[00m"
        fi
      else
        echo "\033[01;31mSorry \033[00m: \033[00m'$tool_name' \033[01;32mis already installed !!\033[00m"
      fi
    # for any new installer
    # put here
    fi
  fi
}

# check tool is exists or not
cli_install() {
  # get tools data
  for data in `grep -i "^$1" $tools_data`; do
    # display tools name from data
    for tool in $data; do
      # convert to lower case and check tool name
      if [ `echo $tool | cut -d"|" -f1 | tr 'A-Z' 'a-z'` = `echo $1 | tr 'A-Z' 'a-z'` ]; then
        get_tool_data=$tool
      fi
    done
  done
  # check data exists or not
  if [ $get_tool_data ]; then
    install_process $get_tool_data
  else
    echo "\033[01;31mSorry \033[00m: '$1' \033[01;31mtool not found !!\033[00m"
    similar=`grep -i "^$1" $tools_data | cut -d"|" -f1`
    if [ "$similar" ]; then
      echo "\033[01;34mDid you mean\033[00m:"
      echo -n "\033[01;32m"
      grep -i "^$1" $tools_data | cut -d"|" -f1
      echo -n "\033[00m"
    fi
  fi
}

# search tool
cli_search() {
  # get tools data
  similar=`grep -i "^$1" $tools_data | cut -d"|" -f1`
  if [ "$similar" ]; then
    echo -n "\033[01;32m"
    grep -i "^$1" $tools_data | cut -d"|" -f1
    echo -n "\033[00m"
  fi
}

# remove function
cli_remove() {
  # add remove tools functionality for remove tools data now it only uninstall pegasus-one.
  # removing pegasus-one only
  if [ -e $bin/pegasus-one ]; then
    if [ -d $conf_dir/pegasus-one ]; then
      if [ $sudo ]; then
        $sudo rm -rf $bin/pegasus-one
        $sudo rm -rf $conf_dir/pegasus-one
      else
        rm -rf $bin/pegasus-one
        rm -rf $conf_dir/pegasus-one
      fi
    fi
  fi
  # check pegasus-one removed or not
  if [ ! -e $bin/pegasus-one ]; then
    if [ ! -d $conf_dir/pegasus-one ]; then
      echo "\033[00m'pegasus-one' : \033[01;32muninstalled successfully !!\033[00m"
    fi
  fi
}

# cli mode
if [ $# -eq 1 ]; then
  case $1 in
    start)
      menu
    ;;
    list|-l)
      cli_list_all
    ;;
    update|-u)
      cli_update
    ;;
    remove|-r)
      cli_remove
    ;;
    help|-h)
      echo "\033[01;33mpegasus-one \033[01;31mv0.1"
      echo "\033[00mUsage \033[00m: \033[01;33m pegasus-one \033[00m[option]... [toolname]...\033[00m"
      echo "\n  \033[01;34mOption  \tDescription\033[00m"
      echo "  -----------  \t--------------------"
      echo "  help, -h  \tdisplay this help."
      echo "  list, -l  \tlist all tools."
      echo "  list -a  \tlist all tools."
      echo "  -l a  \tlist all tools."
      echo "  install, -i  \tinstall any tools."
      echo "  search, -s  \tsearch tools."
      echo "  update, -u  \tupdate pegasus-one."
      echo "  start  \tstart pegasus-one menu mode."
    ;;
    *)
      echo "\033[01;31mSorry \033[00m: '$1' \033[01;31minvalid option!!\033[00m"
      echo "\033[01;34mtype \033[00m:\n  'pegasus-one -h' or 'pegasus-one help' for help.\033[00m"
    ;;
  esac
elif [ $# -eq 2 ]; then
  case $1 in
    list|-l)
      case $2 in
        -a|a)
          cli_list_all
         ;;
        *)
          echo "\033[01;31mSorry \033[00m: '$2' \033[01;31minvalid option!!\033[00m"
          echo "\033[01;34mtype \033[00m:\n  'pegasus-one -h' or 'pegasus-one help' for help.\033[00m"
        ;;
      esac
    ;;
    install|-i)
      cli_install $2
    ;;
    search|-s)
      cli_search $2
    ;;
    *)
      echo "\033[01;31mSorry \033[00m: '$1' \033[01;31minvalid option!!\033[00m"
      echo "\033[01;34mtype \033[00m:\n  'pegasus-one -h' or 'pegasus-one help' for help.\033[00m"
    ;;
  esac
else
  echo "\033[01;34mtype \033[00m:\n  'pegasus-one -h' or 'pegasus-one help' for help.\033[00m"
fi

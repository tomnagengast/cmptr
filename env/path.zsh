pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

# Use project specific binaries before global ones
pathadd $HOME/.local/bin
# pathadd /usr/local/bin
# pathadd /usr/local/sbin

# Homebrew
# pathadd /opt/homebrew/bin

# Composer
# pathadd $HOME/.composer/vendor/bin
# pathadd vendor/bin

# Node
# pathadd $HOME/.node/bin
# pathadd node_modules/.bin

# Bun
# pathadd $BUN_INSTALL/bin

# pyenv
# pathadd $(pyenv root)/shims
# pathadd $PYENV_ROOT/bin

# Rust
# pathadd $HOME/.cargo/env
# pathadd $HOME/.cargo/bin

# Go
# pathadd $HOME/go/bin

# Herd
# pathadd /Users/tomnagengast/Library/Application Support/Herd/bin

# Snowflake
# pathadd /Applications/SnowSQL.app/Contents/MacOS
# pathadd /Applications/Sublime Text.app/Contents/SharedSupport/bin
# pathadd /Applications/Postgres.app/Contents/Versions/latest/bin

# Java
# pathadd $JAVA_HOME/bin # /opt/homebrew/opt/openjdk/bin


#!/bin/bash

typewrite(){
    text="$1"
    delay="${2:-0.03}"
    for (( i=0; i<${#text}; i++ )); do
        printf "%s" "${text:$i:1}"
        sleep "$delay"
    done
    printf "\n"
}

echo_step(){
    typewrite "$1"
    sleep 0.4
}

echo_step "⚙️ Preparing shell scripts workspace..."

if [ -f "shell_scripts.tar.gz" ]; then
    echo_step "🧹 Removing existing shell scripts archive..."
    rm -f shell_scripts.tar.gz
fi

if [ -d "shell_scripts" ]; then
    echo_step "🧹 Removing existing shell scripts directory..."
    rm -rf shell_scripts
fi

echo_step "📂 Creating shell scripts directory..."
mkdir -p shell_scripts

touch shell_scripts/hello_script.sh
echo_step "📝 Creating hello script..."
sleep 0.3

echo_step '📝 Writing hello script...'
echo "#! /bin/bash" > shell_scripts/hello_script.sh
echo "echo 'Hello, Script!'" >> shell_scripts/hello_script.sh
sleep 0.3

touch shell_scripts/goodbye_script.sh

echo_step "Creating goodbye script..."
echo "#! /bin/bash" > shell_scripts/goodbye_script.sh
echo "echo 'Goodbye, Script!'" >> shell_scripts/goodbye_script.sh
sleep 0.3

echo "📦 Compressing shell scripts..."
sleep 0.5
tar -czf shell_scripts.tar.gz shell_scripts

typewrite "✨ All tasks completed successfully"
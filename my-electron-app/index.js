const { app, BrowserWindow } = require('electron');
const path = require('path');
const {spawn} = require('child_process');

let win;

function createWindow () {
    win = new BrowserWindow(
        {
            width: 800,
            height: 600,
            webPreferences: {
                nodeIntegration: true
            }
        }
    );

    win.loadFile('index.html');

    const python = spawn(path.join('..', 'my-electron-app-backend', '.venv', 'Scripts', 'python.exe'),
        [path.join('..', 'my-electron-app-backend', 'app.py')])

    python.stdout.on('data', (data) => {
        console.log(`stdout: ${data}`);
        // Parse the port number from the console output here
        // and notify your renderer process via IPC
    });

    python.stderr.on('data', (data) => {
        console.error(`stderr: ${data}`);
    });

    python.on('close', (code) => {
        console.log(`child process exited with code ${code}`);
    });

}

app.whenReady().then(createWindow);

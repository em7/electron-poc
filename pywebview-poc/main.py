from threading import Thread, Event
import subprocess

import webview

stop_event = Event()

def run():
    proc = subprocess.Popen(['my-web-server.exe'],
                            stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT,
                            creationflags=subprocess.CREATE_NO_WINDOW)

    while not stop_event.is_set():
        output = proc.stdout.readline()
        if proc.poll() is not None:
            break
        if output:
            print(output.strip().decode('utf-8'))

    proc.kill()


def on_loaded():
    print("DOM ready")

    webview.windows[0].events.loaded -= on_loaded
    #webview.windows[0].load_html('<html><body><h1>pywebview wow CHANGED!</h1><body></html>')
    webview.windows[0].load_url('http://localhost:8080/')


if __name__ == '__main__':
    t = Thread(target=run)
    t.daemon = True  # Daemon threads exit when the program exits
    t.start()

    window = webview.create_window('Hello World', html='<html><body><h1>pywebview wow!</h1><body></html>')
    window.events.loaded += on_loaded

    webview.start()

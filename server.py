import http.server
import socketserver

PORT = 8080
Handler = http.server.SimpleHTTPRequestHandler

if __name__ == "__main__":
    with socketserver.TCPServer(("", PORT), Handler) as httpd:
        print(f"Сервер запущен на порту {PORT}", flush=True)
        httpd.serve_forever()

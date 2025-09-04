const http = require('http');
const fs = require('fs');
const path = require('path');

const server = http.createServer((req, res) => {
    console.log('Received request for:', req.url);
    
    let filePath = '.' + req.url;
    if (filePath === './') {
        filePath = './index.html';
    }
    
    console.log('Looking for file:', filePath);

    const extname = path.extname(filePath);
    let contentType = 'text/html';
    switch (extname) {
        case '.js':
            contentType = 'text/javascript';
            break;
        case '.css':
            contentType = 'text/css';
            break;
    }

    fs.readFile(filePath, (error, content) => {
        if (error) {
            console.error('Error reading file:', error);
            if(error.code === 'ENOENT') {
                res.writeHead(404);
                res.end('File not found');
            } else {
                res.writeHead(500);
                res.end('Server error: ' + error.code);
            }
        } else {
            console.log('Successfully serving file:', filePath);
            res.writeHead(200, { 'Content-Type': contentType });
            res.end(content, 'utf-8');
        }
    });
});

const PORT = 3000;
server.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}/`);
    console.log('Current directory:', process.cwd());
    console.log('Files in directory:', fs.readdirSync('.'));
}); 
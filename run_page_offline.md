# How to Run Your GitHub Pages Site Offline

This guide explains how to run your GitHub Pages site offline on your local machine using Jekyll. Follow these steps to edit and preview your site in real-time.

---

## Prerequisites

1. **Install Ruby**:
   - [Download and install Ruby](https://www.ruby-lang.org/en/documentation/installation/).

2. **Install Jekyll and Bundler Gems**:
   Open a terminal and run:
   ```bash
   gem install jekyll bundler
   ```

3. **Clone Your GitHub Pages Repository**:
   Replace `your-username` and `your-repository-name` with your details:
   ```bash
   git clone https://github.com/your-username/your-repository-name.git
   cd your-repository-name
   ```

---

## Steps to Run Your Site Offline

### 1. Install Dependencies
Run the following command in your repository directory to install the required gems:
```bash
bundle install
```

### 2. Serve the Site Locally
To start a local server for your site, use the command:
```bash
bundle exec jekyll serve
```

### 3. Access the Local Site
After running the above command, Jekyll will provide a local address, typically:
```
http://127.0.0.1:4000
```
Open this URL in your browser to preview your site.

### 4. Monitor Changes in Real-Time
Jekyll automatically detects changes in your files and rebuilds the site. Simply refresh your browser to see the updates.

---

## Optional: Stop the Server
To stop the local server, press `Ctrl+C` in the terminal where the server is running.

---

## Troubleshooting

1. **Error: "Command not found: bundle"**
   - Ensure Ruby and Bundler are installed correctly. Run:
     ```bash
     gem install bundler
     ```

2. **Port Already in Use**:
   - If the default port (`4000`) is in use, specify a different port:
     ```bash
     bundle exec jekyll serve --port 5000
     ```

3. **Changes Not Showing**:
   - If changes aren’t visible, clear your browser cache or restart the server.

---

Your GitHub Pages site is now running offline. You can edit and preview your changes seamlessly!


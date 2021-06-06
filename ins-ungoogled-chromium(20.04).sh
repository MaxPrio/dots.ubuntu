#ungoogled-chromium
#Ubuntu 20.04
echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/ /' | sudo tee /etc/apt/sources.list.d/home-ungoogled_chromium.list > /dev/null
curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/Release.key' | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home-ungoogled_chromium.gpg > /dev/null
sudo apt update
sudo apt install -y ungoogled-chromium

cat <<"EOF"

To enable adding extentions from chromium web store
  1. On the page 'chrome://flags/#extension-mime-request-handling'
     Change 'Handling of extension MIME type requests' to Always prompt for ins
  2. On the page 'chrome://extensions'
     in the top right, enable Developer mode  
  3. Download 'Chromium.Web.Store.crx'
     from 'https://github.com/NeverDecaf/chromium-web-store/releases/latest'
  4. Go to the 'file:///path/to/the/Chromium.Web.Store.crx' page, and click 'Add Extention'.

  P.S uBlock Origin page link 'https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en'

EOF

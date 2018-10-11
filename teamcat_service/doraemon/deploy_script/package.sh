cp logconfig.conf ../doraemon/logconfig.conf
cp settings.py ../doraemon/settings.py
cp web_uwsgi.ini ../web_uwsgi.ini
cp websocket_uwsgi.ini ../websocket_uwsgi.ini
rm -rf ../logs
mkdir ../logs
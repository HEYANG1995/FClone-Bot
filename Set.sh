#! /bin/bash
cd ./iCopy/config
echo "[tg]

"token = "\"$BOT_TOKEN\"

"usr_id = "\"$USER_ID\"

[database]

"db_connect_method = "\"$DB_CONNECT_METHOD\"

"db_addr = "\"$DB_ADDRESS\"

"db_port = "$DB_PORT""

"db_name = "\"$DB_NAME\"

"db_user = "\"$DB_USERNAME\"

"db_passwd = "\"$DB_PASS\"

[general]

"language = "\"$LANGUAGE\" 

"cloner = "\"$CLONER\"

"option = "\"$OPTION\" 

"remote = "\"$RCLONE_RMT\"

"parallel_c = "\"$PARALLEL_CHECKERS\"

"parallel_t = "\"$PARALLEL_TRANSFERS\"

"min_sleep = "\"$MIN_SLEEP\"

"sa_path = "\"$SA_PATH\"

run_args = $RUN_ARGS
" >> conf.toml
echo "[$RCLONE_RMT]
type = drive
scope = drive
"client_id: = $CLIENT_ID"
"client_secret: = $CLIENT_SECRET"
"refresh_token: = $REFRESH_TOKEN"
"service_account_file = /app/iCopy/accounts/$SA_INIT_FILE"
"service_account_file_path = $SA_PATH"
"team_drive = $FOLDER_ID"
" >> rclone.conf
cd ..
curl -L $SA_ZIP_URL -o accounts.zip
unzip -jq accounts.zip -d /app/iCopy/accounts/
chmod 777 iCopy.py
python3 iCopy.py

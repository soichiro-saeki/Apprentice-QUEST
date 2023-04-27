while true; do
        echo "パスワードマネージャーへようこそ！: "
        read -p "次の選択肢から入力してください Add Password/Get Password/Exit: " answer
        case $answer in
                "Add Password")
                        read -p "サービス名を入力してください: " service
                        read -p "ユーザー名を入力してください: " user
                        read -p "パスワードを入力してください: " pass
                        passfile=$(gpg -d passmanege.txt.gpg)
                        echo $passfile$'\'$service:$user:$pass | gpg -e -r goku.sou19941126@gmail.com passmanege.txt
                        ;;
                "Get Password")
                         gpg -d passmanege.txt.gpg > passmanege.txt
                        read -p "検索するサービス名を入力してください: " search_service
                        result=$(grep "^$search_service:" passmanege.txt)
                        if [ -z "$result" ]; then
                                echo "そのサービス名は登録されてません"
                        else
                                echo "$result"
                        fi
                        ;;
                "Exit")
                        echo Thank you!
                        break
                        ;;
        esac
        
done

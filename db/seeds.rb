# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Admin",
             email: "admin@gmail.com",
             year: "2018年度",
             major: "Webデザイン科",
             password: "000000",
             password_confirmation: "000000",
             admin: true )

User.create!(name:  "abc",
                email: "abc@gmail.com",
                year: "2018年度",
                major: "Webデザイン科",
                password: "000000",
                password_confirmation: "000000",
                admin: false )
User.create!(name:  "bcd",
            email: "bcd@gmail.com",
            year: "2018年度",
            major: "Webデザイン科",
            password: "000000",
            password_confirmation: "000000",
            admin: false )

User.create!(name:  "cde",
            email: "cde@gmail.com",
            year: "2018年度",
            major: "Webデザイン科",
            password: "000000",
            password_confirmation: "000000",
            admin: false )
User.create!(name:  "def",
            email: "def@gmail.com",
            year: "2018年度",
            major: "Webデザイン科",
            password: "000000",
            password_confirmation: "000000",
            admin: false )

Content.create!(name:  "綱引き",
            year: "2019年",
            catch: "力対力の戦い！自分の陣地に綱を引き寄せ！",
            collaboration: 3,
            intensity: 3,
            category: "色別対抗",
            detail: "力対力の戦い、綱引きです。チーム一丸となり、タイミングを見計らって思いっきり綱を引いてください。自分の陣地に綱を引き寄せたチームが勝利です。競技はトーナメント方式で行い、勝ち上がったチームにそれぞれポイントが加算されます。
            各色それぞれ50人によるこの競技は、回戦が2本先取、二回戦、決勝を1本先取とし、すべて20秒での勝負になります。敗者復活戦は行わないため、負けたチームは速やかに退場となります")

Content.create!(name:  "二人三脚",
            year: "2019年",
            catch: "永遠のパートナーになる！？足を結び付けて走れ！",
            collaboration: 5,
            intensity: 2,
            category: "色別対抗",
            detail: "２人の足をバンドで結びつけて、障害物をクリアしていく色別対抗の２人３脚障害物競争です。（単レース）各色１５組３０名が出場します。
            この競技は、男同士、女同士、カップルでもＯＫです。
            <br><障　害　物>
            <br>1.悪路通過 … フワフワマットの上を2人仲良く、通過します。
            <br>2.輪くぐり … フラフープをひとつ拾って頭から足先まで通します。")

Content.create!(name:  "騎馬戦",
            year: "2019年",
            catch: "白熱になる戦場！ヘルメットの風船を守ろう！",
            collaboration: 5,
            intensity: 3,
            category: "色別対抗",
            detail: "各色4人1組を1騎とし、各色10騎（40人）による色別対抗の騎馬戦です。
            競技はトーナメント方式で行い、勝ち上がったチームにそれぞれポイントが加算されます。勝敗はヘルメットについている風船が取られた（落ちた・割れた・外れた）時点で失格となり、競技終了時に残っている騎馬の数を競いますから最後までつぶれないように！各試合時間は30秒の1本勝負です。")

Content.create!(name:  "縄取り",
            year: "2019年",
            catch: "なわの取り合い？！縄を多く奪おう！",
            collaboration: 3,
            intensity: 4,
            category: "色別対抗",
            detail: "中央にある縄をスタートの合図と共に取りに行きます。簡単に取れる縄も有れば、取り合いになる縄も有るでしょう。チームで作戦を考えてより多くの縄を持ち帰ってください。
            <br>制限時間内に、自分の陣地に縄を多く持ち込んだチームの勝利です。終了の合図が有った時点で、自分の陣地にあったものだけをポイントにします。取った縄は必ず、陣地においてから次に行って下さい。暴力行為はペナルティーＢＯＸ行きです。
            <br>競技はトーナメント方式で行い、勝ち上がったチームにそれぞれポイントが加算されます。各色それぞれ40人によるこの競技は一回戦を３０秒２本、二回戦以降は３０秒１本行い、獲得本数の多いチームの勝利となります。またリボンを巻いた高得点のなわを一本用意し、同点の場合はその縄が、あるほうを勝利とします。
            <br>一回戦に関しては、２本での合計で勝敗を決める。同点の場合２本目で縄があった方を勝利とする。")

Content.create!(name:  "クラス対抗リレー",
            year: "2019年",
            catch: "唯一のクラス対抗戦！一番盛り上がるメイン種目",
            collaboration: 3,
            intensity: 5,
            category: "クラス対抗",
            detail: "スポーツフェスティバル唯一のクラス対抗戦、各クラスの代表によるクラス対抗リレーです。俊足を揃えて優勝を目指すクラスや数々のパフォーマンスを繰り広げるクラスもあり、多くの競技の中でも一番盛りあがるメイン種目とも言えるでしょう。
            <br>この種目は男子の部と女子の部に分かれて競技が行われ、それぞれの優勝クラスには校長杯並びに豪華賞品が選手に授与されます。チームの編成は１クラス５人でチームを作ります。走る距離は勝ち抜く毎に増えていきます。男子・女子ともに半周になります。")

Content.create!(name:  "ショットダッシュ",
            year: "2019年",
            catch: "30mショットダッシュ！最速王を決定する",
            collaboration: 1,
            intensity: 5,
            category: "自由参加",
            detail: "30ｍ（予定）のショートダッシュです。
            <br>男子は予選1レース10人を基本として行います。
            <br>女子は予選1レース6人を基本とします。")

Content.create!(name:  "ストラックアウト",
                year: "2019年",
                catch: "ストラックボードに向かってボールを投げ！",
                collaboration: 1,
                intensity: 4,
                category: "アトラクション",
                detail: "ホームベース上に設置されたストラックボードに向かってボールを投げ、倒した的の数を競う競技です。男子・女子ともにマウンドから投球します。女子はストラックボードをマウンドから１０m位置に設置することも可能です。一人５球、制限時間２分以内に投球し倒した的の数と投球開始から終了までのタイムを選手の記録とします。倒した的の数が同数の場合は、タイムの速い選手をトップ選手とします。")

Content.create!(name:  "応援団長は君だ",
                year: "2019年",
                catch: "勝利条件は目立つこと！裁判の独断と偏見で決める！",
                collaboration: 5,
                intensity: 1,
                category: "エキシビション",
                detail: "競技の合間に不定期に開催されるエキシビジョン種目です。
                勝利条件は人より目立つこと！競技が始まったらカメラに向かってアピール開始！アナウンサーの独断と偏見により勝利者が決定します！勝利者には豪華景品も！！")
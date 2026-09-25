#!/bin/bash

mkdir -p ~/avs-lab1/lab0/claude_monet/warehouse

mkdir -p ~/avs-lab1/lab0/claude_monet/meat_delivery

mkdir -p ~/avs-lab1/lab0/claude_monet/fish_delivery

mkdir -p ~/avs-lab1/lab0/claude_monet/kitchen/hot_station

mkdir -p ~/avs-lab1/lab0/claude_monet/kitchen/cold_station

mkdir -p ~/avs-lab1/lab0/claude_monet/office

cat > ~/avs-lab1/lab0/claude_monet/warehouse/stock_list <<'EOF'
На складе осталось десять упаковок мяса
Свежая рыба размещена в холодильнике
Поставщик зелени ожидается вечером
EOF

cat > ~/avs-lab1/lab0/claude_monet/warehouse/rejection_log <<'EOF'
Поставщик забрал коробку испорченных овощей
Две упаковки мяса отправлены на возврат
Баринов потребовал заменить продукты сегодня
EOF

cat > ~/avs-lab1/lab0/claude_monet/meat_delivery/senya_invoice <<'EOF'
Говядина двадцать килограммов
Телятина десять килограммов
Поставщик мяса подтвердил вес заказа
EOF

cat > ~/avs-lab1/lab0/claude_monet/meat_delivery/supplier_note <<'EOF'
Доставка мяса задержалась на сорок минут
Сеня принял продукты на складе
Следующий заказ привезут утром
EOF

cat > ~/avs-lab1/lab0/claude_monet/fish_delivery/fedya_invoice <<'EOF'
Сибас двенадцать штук
Дорадо восемь штук
Поставщик рыбы добавил коробку льда
EOF

cat > ~/avs-lab1/lab0/claude_monet/fish_delivery/freshness_report <<'EOF'
Рыба имеет свежий запах
Температура при доставке не нарушена
Федя разрешил использовать весь заказ
EOF

cat > ~/avs-lab1/lab0/claude_monet/kitchen/hot_station/barinov_claim <<'EOF'
Баринов недоволен опозданием машины
Шеф требует проверять каждого поставщика
Качество продуктов важнее скидки
EOF

cat > ~/avs-lab1/lab0/claude_monet/kitchen/cold_station/fish_order <<'EOF'
Для банкета требуется свежая рыба
Федя выбрал сибаса и дорадо
Заказ нужно передать Вике
EOF

cat > ~/avs-lab1/lab0/claude_monet/office/vika_payment <<'EOF'
Вика получила накладные от Сени и Феди
Оплата поставщикам назначена на вечер
Возврат продуктов вычитается из суммы
EOF

cat > ~/avs-lab1/lab0/delivery_call <<'EOF'
Поставщик позвонил перед открытием ресторана
Машина с продуктами стоит у входа
Лёва должен открыть склад
EOF



chmod 755 ~/avs-lab1/lab0/claude_monet

chmod 640 ~/avs-lab1/lab0/claude_monet/warehouse/stock_list

chmod 750 ~/avs-lab1/lab0/claude_monet/meat_delivery

chmod 644 ~/avs-lab1/lab0/claude_monet/meat_delivery/supplier_note

chmod 640 ~/avs-lab1/lab0/claude_monet/fish_delivery/fedya_invoice

chmod 644 ~/avs-lab1/lab0/claude_monet/fish_delivery/freshness_report

chmod 750 ~/avs-lab1/lab0/claude_monet/kitchen

chmod 640 ~/avs-lab1/lab0/claude_monet/kitchen/hot_station/barinov_claim

chmod 750 ~/avs-lab1/lab0/claude_monet/office

chmod 640 ~/avs-lab1/lab0/claude_monet/office/vika_payment

chmod u=rwx,g=rx,o= ~/avs-lab1/lab0/claude_monet/warehouse

chmod u=rw,g=r,o= ~/avs-lab1/lab0/claude_monet/warehouse/rejection_log

chmod u=rw,g=r,o= ~/avs-lab1/lab0/claude_monet/meat_delivery/senya_invoice

chmod u=rwx,g=rx,o= ~/avs-lab1/lab0/claude_monet/fish_delivery

chmod u=rwx,g=rx,o= ~/avs-lab1/lab0/claude_monet/kitchen/hot_station

chmod u=rwx,g=rx,o= ~/avs-lab1/lab0/claude_monet/kitchen/cold_station

chmod u=rw,g=r,o= ~/avs-lab1/lab0/claude_monet/kitchen/cold_station/fish_order

chmod u=rw,g=r,o= ~/avs-lab1/lab0/delivery_call

git add
git commit -m "part1"
git push origin master


cp ~/avs-lab1/lab0/delivery_call ~/avs-lab1/lab0/claude_monet/office/call_copy

cp -r ~/avs-lab1/lab0/claude_monet/fish_delivery ~/avs-lab1/lab0/claude_monet/warehouse/fish_backup

cd ~/avs-lab1/lab0 && ln -s claude_monet/warehouse/stock_list stock_link && cd ~

cd ~/avs-lab1/lab0/claude_monet/kitchen && ln -s ../warehouse warehouse_access && cd ~

ln ~/avs-lab1/lab0/claude_monet/meat_delivery/senya_invoice ~/avs-lab1/lab0/claude_monet/meat_delivery/invoice_duplicate

cat ~/avs-lab1/lab0/claude_monet/meat_delivery/senya_invoice \
    ~/avs-lab1/lab0/claude_monet/fish_delivery/fedya_invoice \
    > ~/avs-lab1/lab0/claude_monet/warehouse/all_invoices

cat ~/avs-lab1/lab0/claude_monet/warehouse/rejection_log >> ~/avs-lab1/lab0/claude_monet/kitchen/hot_station/barinov_claim

mv ~/avs-lab1/lab0/claude_monet/kitchen/cold_station/fish_order ~/avs-lab1/lab0/claude_monet/office/urgent_fish_order

git add
git commit -m "part2"
git push 


ls -lR ~/avs-lab1/lab0 | grep '^-' | grep -v 'copy' | sort -k5 -n | tail -n 5

grep -rhiE 'поставщик|продукт' ~/avs-lab1/lab0/claude_monet | grep -vi 'утром' | sort | head -n 6

grep -rli 'рыб' ~/avs-lab1/lab0/claude_monet/fish_delivery ~/avs-lab1/lab0/claude_monet/warehouse/fish_backup | wc -l

for f in ~/avs-lab1/lab0/claude_monet/meat_delivery/senya_invoice ~/avs-lab1/lab0/claude_monet/fish_delivery/fedya_invoice; do
    tail -n 2 "$f"
done | grep -iE 'поставщик|килограмм|штук' | sort -r

grep -vi 'поставщик' ~/avs-lab1/lab0/claude_monet/warehouse/all_invoices | sort -r | head -n 3 | wc -w

find ~/avs-lab1/lab0 -type f -links 2 -ls | sort -k1,1 -n

ls -lR ~/avs-lab1/lab0 | grep '^l' | sort -k9 | tail -n 1


rm ~/avs-lab1/lab0/claude_monet/office/call_copy

rm ~/avs-lab1/lab0/stock_link

rm ~/avs-lab1/lab0/claude_monet/kitchen/warehouse_access

rm ~/avs-lab1/lab0/claude_monet/meat_delivery/invoice_duplicate

rm ~/avs-lab1/lab0/claude_monet/office/urgent_fish_order

rmdir ~/avs-lab1/lab0/claude_monet/kitchen/cold_station

rm ~/avs-lab1/lab0/claude_monet/warehouse/rejection_log

rm -r ~/avs-lab1/lab0/claude_monet/warehouse/fish_backup
git add
git commit -m "part3"
git push 

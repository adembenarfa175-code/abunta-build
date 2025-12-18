ls
# إضافة المستودع الرسمي لـ Abunta
echo "deb [trusted=yes] https://adembenarfa175-code.github.io/abunta-repos/ arixie main" > /etc/apt/sources.list.d/abunta.list
# تحديث قائمة الحزم
apt update
# التأكد من وجود المجلدات الأساسية
mkdir -p /boot/grub
# تهيئة معرف النظام (Machine ID) وهو ضروري لـ Systemd
systemd-machine-id-setup
# ضبط التوقيت (اختياري ولكن مهم للسكربتات)
ln -sf /usr/share/zoneinfo/UTC /etc/localtime
# تثبيت النواة وحزم الإقلاع
apt install -y linux-image-rt-amd64 grub-common grub-efi-amd64 grub2
# داخل الـ chroot
apt install -y ca-certificates
apt install -y linux-image-rt-amd64 grub-efi-amd64 os-prober
ls /boot/
apt clean
apt autoremove
apt install -y ca-certificates --disablerepo=abunta # استخدم مستودع دبيان فقط لهذه الخطوة
apt install -y ca-certificates
apt update
# اخرج من الـ chroot
exit

#!/data/data/com.termux/files/usr/bin/bash
skip=50
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/data/data/com.termux/files/usr/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��wh1.sh �Vmo�6�\����5KI��C�V��&�`�a�(��$�*I91����$+�����6}�t��G�sϑ�8��)!l���p0�U���y<<BS��Qm����6��y4|�f�z�7n�WC�H�i/�Җ��)\~��ߝ�p0%̳�zaUyMe.\T:K��!�Th xj�/0�����lrq~����8�l��)-$��D �^��C��Bh��{��N�L'��35�z�!�q/�^����gR�`a�pm#�2n��#2���� 0EU�П�T�r���k�1�t�����v��y��/��u�����*�f��V(^���X5j3ث�`7�]ҬQ�����n�([k,�@��va<���o������8�t(���JЏj�k��Ϟ��R�i�՛��n|���ˏ��{چ{B�Q,u4/4�9���C����8
�
A:����͎���s�4���V�yc�L���)���DZ�\M"Wk~o֚ <�B{��	��ˑH&ě����l1=��8��8n˱��s�,)�Q�,�T�E�t2�5Bt@o��!(��dU˾���(���1���Sn4�W����.zU*�@
��� kB|'%���s$���aj�C�W`7t/&��1�VV��w�G�Ȫ���IW���	c	�*d��+�K\��%

�<�8,�U��Ф'A
A�M���H�A��|��b���K�X*�7�7��k�����:ˤ ��s2:��?�Gt�Yu?F͂;LK�U;/gl�֞ouBu���h��H�/�I�`Zƨ/�l0��0�л5�g��Is�bѠ��x��y�UY����ɺ���\8�����Ϻ�Wg���?ޞ]��ާ��)/`B�ΧV���Х��3�>s�W�7!r'���)���PB�QM�-�v�tQ
  
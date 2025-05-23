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
if command -v mktemp >/dev/null 2>&1; then
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
���-h1.sh �UKo�6>��b�nẀ�}�F���搴pM��0"G+F���>��;�>�M�{9�p^�|��4A/����C2�������8��$Sp���I��[g���g�w	<�!�d �������_o�>����i2�UCͿm�@��� C��P�����y H�'h��?���+�D�5Gz} ����J�ll��QX� Qh!����lv?��͙(��t>a�ً�^�{�۝8��.Y�����6ߋ/�,	Y:q#�ݾ}��6mL_g�����Z��ߞ��P��8u+NN��R�S�m�x�0�,���&n�f�.ON>����k����2t~Â��%V�a0�3�\,��4��k+΄��Z��:�����)�����N
}@E9\CB믳l�Z�Jʭ�R�,G�����t:�^��1m(���|u5yy5�N'�D��x��FYC��b�%p���@�.r�Ů�KY��c�E��EVغ�+r�/�u�-�#`�!�� �֒��[���
�a]O5���	��:����5GҐ�P�>w����G��n@+�hWA!��,j���ll_X1S�C�}�}o�W�o���u�lb.16�D��ҜXY�6Ѭ�%C�=�x,��j˩F�m��{c��!�h�"�Zn6�{���Xw�$�vp�
.ZHZG>62��3�t��0�	8b�Ds#ǖ�؜���+`���n�4��'˵ɖK�>{IAfr�������m��,�mVۅ}�]����*���f	E/c~�7�%�����4�m�a�k,㲢⊥)�=�����|'%�����t���T݌~��?s_Yk2!���y��ş��f_#6���c��qOMx<V�8}�h�G�ćp���myb�H��X��E��y�������'�ۚ��� �s��8yhnJ���qtȋ6:~<n��X&^v$�]� ^Gp���{�w�/�|.���}KD�1�z`�����cDz�r}���g#=�8Ҳ�<�{[���Q�b��  
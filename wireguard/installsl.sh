#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'installsl.sh' encrypted at Sat Aug  5 23:34:54 WIB 2023
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
BZh91AY&SY=��L  �_�D0}�����������PX<)Z �i(h�  h  h h � d�4244����ѦC�)�&�='�O!2I�1��M4zh�~���d�4244����ѦC� �(d	���i��2y'�G������'�=G���JL�$����d2L���(5q53e�J�^.˚�-*4�_��O���W��8�<��哦� ��y'��;�Z�}��#�xrVց^uD���dmp�w�O�)ݘҟ�Ssٌ���Y1�~�0�
���i9*3QV�֙#:����=}��g�����>z��e���F����!bP�$�K�㢈눫�ڠ`�**�U>�o:�\TE��>�#W_G�z�C9�x:��$����e�Ld�)*<�ݹ/>t��٤/�P~�1��ԫeBI$��r��:���h���Gu��⽓N�Y?sM��FSGޠ��e�-/i���:Ǡ���_�5P��!��p^7h��T���s�������r�^9����tp�tY�12i�~�����0s�\��c�0�4s�BX$���
�c"�p�Yf������3�Bf-�f/��>������r��Br�笍�y�a��4������r����i7��Ĭ���;�7�Ph>wDG�Äտv�qf�sh�g�=�Ul�WT����m,���XU:Y�]�M�rǧ��~)�4�Gď#�N�噓���>.�2.�V�u�z�Ⱥ(Ui���ڿ���?�"Jq��g���SJL1\/�޽����J"E�8D����h.���iT�aii����	����؏��Q�cQ33�if���Q��gWof�����}�n&�nP��l���=�p�	��P��Ƌ�g`�Ǭp�R����}����۫*7��t�rC��7s�i��ׅ莁A���9N�C4>�Q�T]�]�̌T��Y��[˂��s���Z�q�x�}%;ȷ����IB#��ZU��KE�������W�����gI,�^��ī"����4H)u�B0Jdkၵ�Gl2�b-C*2�m�w����&8���N��Q&9�C��쎾�S���1Iw�tSW�(�������M��IqtJ>��ݼ�FvXϐ��!1}��Oƥ��j�[겓NdK4B�y�Y�P�Ƴ�qL��-�\ť�M�+V�(�D�I1a0J��,4ho��a�c�t�zͮ�Y�Qtj1^Ӑ�O��kb-4kB&�W�ҧ#�*RJ��'W�iq����u�a��TtcI�*�T,;��rE8P�=��L
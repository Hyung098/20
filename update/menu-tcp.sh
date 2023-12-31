#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'menu-tcp.sh' encrypted at Sat Aug  5 23:25:16 WIB 2023
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
BZh91AY&SY��7� �_�G������ݯ����a   `
�U �
    !��4@�����@4@ d1 �@�C@�CM 4� �� @4 4 �@4 C hp4 �44 hd4�M � @��I1!=6��CPmL�FF�Ѡ4h�&@4�j� � #JxI䞣D�1S�@�M��� �
9�Agɏ�v��t���|�2���DD�J>�`h�*�����=��/���j6D�fEC�~��Q�%�nǅt�,�ݻ/�(�/��f%�4��?��A���H*XP�B�����c�4שƲ�(�L"U���Q_�����X�`�����rĺ���6[`4����O�~���z�(+�N�`dZ���y=�5��%�U;M���h>��{����jcЅscmd�"��5>3�rڄ�|�H+J�� <<-d����@����< ��$A�h�<���AB�QB��B��O�n<�!�L�X���Ҿs��x���F��[3ѵ��D,J˫LI1��-�*lFv�,)���<��srC��!=甓H`/��}�"�]a�5m~�O�?�n�ϼ�c�C���'M	� ���d�+yu�a
�w�y���L�[���^~o�������ĸ|r痮��("6o$�8�e����)x�ꂪ'D��<RU�l�]�_~~?{+�:R��/i��&��̒�xR ՑFDV�m%������#㚭�`��]�@���i�;�[�i�Y�A��-��w���,w^̠ӽ{��Nv�سf����p�:��%�w�����۴��q�}����*�pzԢXJ!!$�A��g��������� ��"�ψ��{F�̓:���6=�~�
`�(��:N��A��Xs� `/�����<�<�{�|Z ��|yF�_�AX�	��([m,ɠ�BUm9�U����~t
�^~�����]B�ȴI 	U��0�6�]#�D���i`�_���@¬�f�HA�j��9=Y:E⎶n]$9�@���M���H�; }�Bb�Г`2�P������.�־�(�q�m������<+el�ͩ`��:�#]���h�fk��dڢ#N+c���@��b�/���D�BU��v `2Uֈ �
����(ΖCX� �r��V�?��	.F/$����l����.0/- �=I�/$r>"�LBG����P��C�u���lT�I|��H������
�.�S��$K!. �\NQtJ��A�I3�ؔ��R����� �ş� �	%�3��R�A��_tF����d�~"�#��2�lPr�@����m]��%d�^���S�b"0E>g���7b�PX�8v�u��,������^Ѐ.��$�P� � ���"#���` A�-�HI�����v�[��D��a�lJnMނL�f����6�8��Zm(��#2!%v�Ɋ�ܣ���F�\�ZxB��f,:��š�I�\�Xx�	�.�5�~︇Q����xyJI^!*�I�i���u��!x����kJ�'9bۺ"#dHbbZAC��*��73�w5I@�Q[��Z��1!|�K�uҤ7�A�R�1P$�P��ftޭ�U�(s�q�HM'0h$�-�K�]0P=��(���^�bZ2\�%u��o6�X���� >�ڥ�K�u	wqh>x���H��@��6	*d���%�R��H�{L�nIY���W�`!��R`�a����@M�}\z�YЃr4!
ȉ�S�}���g������Hّ� �z�/HI��x� F���d[�ٸ���>w��({�B0e����P�+X��k!�""0��)!`\[j��m���Mm,	@����<���4;����ۇ��&�	(�BF��T�v!e���`=��E�9��,A8)��FMt�S�p+��1y�KF�@P{�5�X��BϬU�ە��P7�]�!H��� �ڎF���@54Cea�6oa��<�Z���BѴMe��eOxii�1�:����e�9�� �ȭ��;���]�<�A'e��Ac'�.�m*�$�HP`O�9������`c&2/P����\b�-gjo�|[�
�񐢫�#ayN]���� QZ�o��]��BB",ޘ
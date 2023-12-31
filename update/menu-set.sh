#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'menu-set.sh' encrypted at Sat Aug  5 23:25:20 WIB 2023
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
BZh91AY&SYȬ�g f��?�� �����������a   `	�}��og���.�h2    '�%'�z'�z���xP4���3P�  @   �MLک�Q������� hh4�� �  � �� ��   �O�Jz#2`�@bbA�h422�h� "�M5=OTƠd�M d����#@2 �MM���" &��ш)�ɓ)����z��44h��S��MЛ���+�o�#��~�����vR����b�Z
�سF�E?����/�$�����6���-��L[��6E�UvH     ��E.爲�(�P$m$ׅ(� V���� �Ɋ�J�p� �
l���ҟ�q?nt�ї��Q�<����_�,�벓�1`��~��3 �`��������cz��@�#���G�W�%F0����q�o��ⰐA�A����NC��wt{=?�������p�(y�}[�:����mhE:��<��"����0j�   s�|�m�[݂���LW����Lgg�'��Èly�)�lخ@H�l�X��������)g4t#�imU�h�ⴎ�Kzd耳 n��Dt�+��ҳ��2����5L�	��""#K���Y��r�2Ae��1�Ԓ�?�r��@6�?!��s�٠���}5X�W�� ��MS���/��#x��V����m��iJn;||\u��L����yэZ�4��R�A�����)��U�b% 0�1���P�7s:z�:� ��bOl��Nc�V*#��`��:	9�* �eP�MzgC32�b:��z�,A"0� Q�l�p�32�d��RDɒNy��q�v���Ht@�O���@�S�lMpDzD\o�b��sPzD̫_Z�f}��b'��������e=�V�ۊPA��mm���b��iJV���V������R�|�`�B@D(��a��QE�.h�t��������".���e.9��U	�S@1��Z$o�"�l[SB���ֽ�r)h�&Q�hJ������ŐT���jSў�A�d����p�erk���l�����t�֏��Y�g�u-0�����T��H�рO Fj�#3�q'ɿ7 )�C ���_x�]��?h���5��BE��pi,����QKx#�� v�nBE5�殟S�H�:��Ba*@1a��l�˚\*j)�=�ɣӉ�T�|�%�"�Z��[&d�GN�h<J�yUD@M��Bs�)�0��e%fyo�LW�t핣J5��{�)U6F�z��,��S��E�� ���@k��<��� �S>�)�K|���x��}�p&j��K����3�m�1���i��sټ[%�(v /-ׯ>�u�X�٢0���A��������!�(������!B�ޑ�L�e3X�����
�@�(�.Tz��mlC�,%u)�84�`X6Z!P�iF�4	�\J90R�	��0�pi�����@����j.p�*�*H�R{�L���h�*�`l�Ja x
��|���q��C3��� ƒk7�A�m8�7��#��-�S�����A�Ġ�	�g��@h�Y�v��M�QK������2��S?j�s�0������>ߖ��|����b[Y(A��J���Pʆ����(5�K� *q��C�B�O� Zw�ܸ/d�t�/3"us����k,��q�z;���9�,'/\�C���;����-�C1�e;I&uN�2�G�1���}�A��w)�r��Ȇ�U��\X�Z�WU�j&�R"�?r���=�yA�jWQT:B¶XD�L�A`���:Lg�9:9��d���]��JB= ��4)���i��9	�1N�	3J��
��)��lD�E)8�$�>j���3�@ANp��8��Kn��Y`Q�AI� ��Q��A����|����R�K��$�WVQב�p#��i�%&�]�B�Bu�%p
�ij�%�jQpIP��n�r���%�)��3�/2A�䈦�;UN
K��"4+~*T�b���������Y*�=̻5cT�v��*6[�M r�;u�^Iu��P��nϯF�/-%�3�w�A� �� ������;�n�].��]BJ ;`[����D��Jv�mԬ�d���CIS B��ܑN$2+8��
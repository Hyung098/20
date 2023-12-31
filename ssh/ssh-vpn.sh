#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'ssh-vpn.sh' encrypted at Sat Aug  5 23:34:56 WIB 2023
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
BZh91AY&SY�	3 ��fp@ }����������`+�7�̺�7��=v����G���АJU֋ـ^�d%4d#M4�O��!�C�h4�S�F�Q���45<j������Ph     F� d��A�b@�11  "D�@ ��d�@�5Ѐ4��ɉ�����hS�jz�6��COS'�h4� � h�H� B`�	�����d�2 �H�hiP���J��wS�|��Bq�F��g7㑳��O��YU�[���é�B����as���}���p�����j�6��wD���C�Q��Qq�Y��Q�朇��N�O(�b5��Ů��p�Ͳ�/I�D2@��ν���ح��U�1�����f����U�G�:_�\]�G%��t��zȌP醸j��K���
u�Z$��˛�U�Kk9z3��+���s�_� -JG?�{���.JPE�n=<���K$�A�T��S�6���>ծȔ"g�0^d�~�� �wR�W���u�� ��\�~�}��i��b�5k��Q]��)���.H�v��f�d�[Kfƥ0����22y6���gi���I���:e8�r؄_��Z�Id"%���l�ΨV�l��<Y�{��� 9����=:����H��Ƈ��,4���Q,��.�c%A�u��rYe��r-Z��u���xuc1�_�;`M�Jgw&><�r���u��h8�p9�G�i��,[��5h�TЃ�
�ݣ"C"	�$�l��5�L�cV�:y!`���Qd�n�.W��q�VΏ��o/�(�����l�62P3ۓ��{.�/-���Q��24���p[�+ �Ȅ�ix����$���;�0���rq��$�VD��հ8!J�]o>�k&J���8�N[���2We}�k��3L����m�K a��0B$�؂r&i�L�FL��*u�����+�����&4S�H��.��ՠEB�nrd��
5�Q!w�߾!�ӑ�"�݈���$R�ɕ"�57�D�@e�-����mS�Z�=.D]6���Z�b_Vy�q�5�����%�4�m��t��h����M.�&�������XS��ï}�Tѥ��ń6��z���%nI�O����[j1��
���9������t`��Ul@���F�>��9�̍t��PcC\�np@D"a�N��&��<p���Pb8��2�a`x�yٺ�Y�� �f֕�4@���6���W��x��+�K׀�)�3X)E�R�W�1��ʂ���⯑s^sG��@NM�Z2,'M�"�Q,��39$l�#�X���^[����������7@�A}�����>
:4|�,�7kk�3��v��y�4J��A݄��\b�@�[M�oHH�����F����7b�4�M�Y�Us��(�#�Q4#o"�����4���#�/��8H�?6=�S�8>"�#<Ep���u�:y��Ȼ������2w�Pdd���ɛ��~�Y��^��V��x�|�ڬ�1��9� �o�Ș��
���з�e.;:ob̉=��;�Y����s���LPF�Ʈ���
q3�z�MC8���,|��Q��E��Szt�=��4���s�#=U9���$��
��+��zt��zr�{mA�E25��@�XzPq��h�|&�+N�g����f�./�3�2���#V?^
O5{=@�[B�]��VbG(�����enF�ћN���-�a�3��o��(~��$$��h��7NQhG���RY#OS�.�u�ͥn�B)tfqV�Y׈�W�!!"�B=�� d0�#!Dm�cS���֔[@�)���"{��D�$N�̠h�5��0��%V��QS]D���@�4Č�b&��ԙ(�u'JP�,�j�����Ek��'b��N��Jp:K-�+h�S`b!"Ob���H���"IT��Ag]X�!�ΨC��/�>��. '"�4�{u�P��~�tCGwL���("�kK9�
E޵ ��2U6;��FE 2��q����<�P����>A?O��4o�^����$@�G�RzCI>�j:�Y�0%�&kV90,�9����C�^�j ر���$#ivCʢ- �z$\�S�'۵b�L"
�^R<e:'��qĚ��f�%�%n�8�E�%	�Ȁ��,7�3��A����K��9��&��k�f�(��:�m� �><|�io�E�������Fx�,�~ڄf��d�Ba�h�!u4�ûH�� ٬���	
M�>��|�m`#�$3�`���AZ'�+���i����=��PG�3?vtY�v���&&�lG�!������a�@�Y�8|�(ZP�Z:�v�f�#^x�GӍ�@%��fKO��&���#5^*TIA�<Fu���e(���/GT�
˟U��(P�:��Y��Y �=_6���R�
�|.����X�NUA�*K�>��y��d����W�g���I{&&$]�mB0r@м،Z�ͥPs^��S��yS��#4�lؤ�lZe]�15�!�C(� ��ڄa@$� �&�Q�����Lh1���3����F�x�kZ�`�B�w�Ej��n�� �҅��9�e��m�-
��Sd�@F����6�1*�\tE1)+�3��Q@>{��!�yH���"I,1#$�~BHB~-�A��L;�Vb�F�ʼ �9�);}	*�@�ZI�u�$����O>H}�l*��Jm#���o��W��F����SZ��%�-E	3$���2Ķ�(@M�m+��E&���}���c�R#�iҼPLU����r ZZ��ٵY#x�oK�5A��V�：*�ڢ�eE��l�0�ꐮ�7�z�@�v(`["���9��r��pU�
$44�V�����
[���V�B����'�D�0"!@4&�1)��o���`n�f�_" �S=��5G5U�30^�c �I���*R�����]�PH���`66
�M�nF��QB�GhFJ��ʤ2��n��2��BA�i�ml`11�B���f� �(F���>�,+Cz?�$��F-!���g�
�*�f�s��"�u�g�Z!���y}P�2n��Ru0�м�ɻvR ���e_)$m��822�5"�FULDZ�X,#�$j���4�W9���M"B�1 Y� 1wFG�E�=��7�m�Z]�1�-k��@5:�*�E�ZW!z�"ز����b�Zh�M� ���3H8	|�^jF�,�]O�JO��Σd�t�)"�ϼҏ��!�D��b;!*���QKP�vS	{�}R����u�@J˨�`�Z��'�"��pw����c؄2�_!-���q���<K��'�0+�%�UeP��DE}m��ZF8�O�����, �B_1p�.��w$S�		��0�
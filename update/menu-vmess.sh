#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'menu-vmess.sh' encrypted at Sat Aug  5 23:25:10 WIB 2023
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
BZh91AY&SY��: ����� ����������aE��  @ � `���Z�W��A����o06� *��à����A�h=@=!�!���      ����j�Q������   h   8      !�       �ԘM�<��M����z Ѧ�I�4MS@F�z�M2h IF��$��SJd~ԡ�CF4�dd�#&L'��M#��E"dh� ��*zzG�S�m)�S��%Fj�Q���6��� J�[a �+"u{��Sk�>���~���x�������hú}mXI�l����>&zOS���N�%�$ZT�;2>��Z��ߒ̍"�#�Z�6M���v5k�i�a�'�y�U�|\��J�7_ՙ��F��3������n�cK�������*��]&?��D&
�]�n2:?�{��
@���7�t�Bˤ����|�X]L���d�s�S�� �R��	)m�J�@=�LH�{�S�e�J�W �_$L��	�3��W��b"S�s0ղ��c�W5�$Q��%�Ӣ����i������1�C����G�A�/�H��EMtw�A��a u�$�@�@x�4�Q,���wW�<c��!�=.�<�+�O�$�1�����l^�8ID�4�N�ghS�Ol��T��n	����t1�ly���ɖ�	V-In}Y�c����BMi$�&�I;���J1E^v�j M�)K��[E�b0|�S�ǔb�Ff����)` �� �G'�q$QRp�gӸ�请�Ï�6Gu�\'?	\�$W.���մ�mbb$���>��py���N�!�ˎD}Į6H�f���-�uw±����6�(9�v]��k���2��*QY p��3�v�l���,ǒ�Q��4./����R<U3UЃ��w���	n��؝2��a�Y)�����xH_PL�L4//4�e"�{fO �Q	kzڲxH<�?@��
L�i��&A $;�� ��D�C��!	A&s[� �H7h9���Ak�$�3�*!�I�m6����6��1��;�,Pe��i�����?`]nߙ16���,c�"Bc��D�co���d���o�3Ų����.��M5� ۳Y�7U����(�����?T
�d'gA)@4
J��A�n�hъw�t z�6�6�D�g�gP�;� �i�x��~���f���������-�?�}d��]���������ʣ�FyP���3��s�{2���H�MD�5�
"x����*J���B�&C��
���1�m��<�\[�Ilc�[]^r�y�Z���M&�c~6'���F��cq֤��]��'���2�v��ɢ8}b
�GG�˵�ax��R�q�kFDODUt�b4�C!���b�z��~Y�s���	
�*H����D���G!Q��evK��K��6�P��Ǣ���40F�-S8@�-�B)a|y��������wՃ�:ցԤ��,0�!�^��	"��B��jp��2q�s����ǰ��^�m��غ\g�7:��(33��_�ј�j\�B�T�\���2TZ�D���o�s݌��������sz����!��՟b�����'Wi`���Ë��Z�2P)��sO��_!�`8�!H�S���u��	[B����a&HA*:	�8���3��"N]����m�E���At����wX�熬u �XOl���C���7?rH��g�����^����}I�ҁ�f�H`Ĥ�No.��u�c�hs�y� ��C��y��r��x���`���AiX�d&J����,۟28Ӝ|���w��3ꤡM�=�=�����	~��Q~��|��S�ʟ�k�!yzq�z�0 �l�r��w�&����FU�������}���Ӹg	�2R�5�Ng���Y r2.Ҋ|�ӈ�[��ENV ��%�8�6Eǖ������<Vb̵���������j�	�}���pqnEH��ΈNZ'\�b�j���e���c~���	�_v�aB>��s0 >�-�r�\@�u15y���2Oh�Q��k�H�3�z�ѣ��%.���R��w�eޡx���+�Ȓ�1t�3��5��w�DݢP�i�BB�$Ez`��	�Fa}A�ga�v��AmϞ3�h�v�<�&�6�h��	m����{�7?Q�!�q2<�d��w'�C�$^���pE ��p͋`W��zM/���A��2�
M�@�d1m8���a4��$�׶F�зӄ�����0�>����.(��i(f&2���لY���%4�T ��#yʜ��7o���A�#���nG<��P!�!����0z�&`����=��9F`ռC�Ԋo�@�J�Մ.n�����T��^�c������ªP��s	dc4��/	&(�PqgV�E0Hd�% -�Z�$@�%��v1 �Ls��$�=&ᾍC�f����q���$-�'g���?[�T�r�m��յ�\T��. A!�� D$�I�2�ul���˩.��AӰՄl���YS�9�or^7D��`�@�A6-b6�T�( Ʀ��`uT��8�HuŔ�
gig�q�I�ȉ��9-����V��5� 13u��%nt:]���KP��ec���P*�In4d��xZU�K6����X� ;�u��%m��Yk�5�4�O&Bd&�s"���ÓP�g%�N쀰}���ē��&�,�B�ʑ �����q�P���G=��ʁ�ݷK.�vV�1�a���,�"8��ף�-�cq���a�Ұ`�u07+�ࡵI���Y�\�j���G0V ������ �/��4o2���&L�Q��2�Ά��2AO9�	���� AE:�A��7I�}Eb�C2ŃB���9�*
+��A��h��H�
4�'@
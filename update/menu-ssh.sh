#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'menu-ssh.sh' encrypted at Sat Aug  5 23:25:18 WIB 2023
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
BZh91AY&SY#�ΐ 	_�������������aA   `��O��a�Z�wuM�R�aJ�ݸ \�f�Jٍ��,��J�[R�H�&��S&h�i�� M ��    @ 2   �h�      � � �  24       I�Be4�D��di=@4=���� ��dd4 �@� �	�M4Ҟ�#jj��"G�L=M��OMM�(1 *H��� �4�L!)�=1OS�'�'���z��6�M�OI��&#OGH�HQ"5H~j���.�j�M�����~Ah�=�����m���ϭ�1b��g��N�m��CD�x�R��-[[Zp�L�_��U�%�Ք��P�=7�0�["\��n��콦������������jY�ָdQEQD��/0X.�/eՍM�C�r���f��.��	0�ػ!v�)��
�M�.��}�{~1��핇1�����W$��995̐3��3�M���d�h�L�nd�p!ƣ�J�EYk�U�yȤS��!&��Ш�,*J�O�T���}����'�e��g�˥Ji9?z�e�ɫS�԰�+�m:��0!���c[��$�JJ�A�0c�@��n˥�0.��0NY`x䪉/"H@/-� ՂZ4,�
(�J�M|��u�-�	`7�����$Ԃ�A���ce>'�ˑ�<�����/��2������ĐXD�'Mt�M�J�Ub�q��]����'(��a�h'����c��(M I���C�6iY}o�����fmB����w��E'<��(��S���8�G�&㰈ZhOJPY�$@�C"������^N���>P����Z�[���)	9z��DH��5������i$�����,5M$ЖO���K�@�/�#/
=A�ô&���>W��c{�g���}��=���I��嫙�����>��Շ�4�f<�z�L>i��z�ꉁ�+��
�� >�u��W��r��=&�b�w���0����w���ja��ګ%�������N%���0��-i_�lZԄ�S0��$@r�M|�y���^�ty�Z2K����ч��ߩR�w����,��/��v�P[o��Q��W%�z���k�8��	\^��Wi� �_��<�$HX.vx��t��k������"�z�V�2���rQ�.�U��<��6�G�v�����ّ�jH��1�ġVK���#)���ae��tS%D�0=(�V�7_����2�ɒe�N�������sr�6Z��������-7j�)b������I4�l��\�bK�?lc�/�E���j��Mv,_���{�W<���ی�%8�e)k�_�6������a�\@�B"�>�#4rN�ܧ�
UK����}�]N	�ק�D���Q�Q��O�RCl�q |��׳v�"  �TD3{�K-`���N��8������#(���!z#m$�����0~E��3�e��qT�m2�1A v�*=����9'?A�ͤ�d27�ݛ��D�!�O��yQ��M�R@*�a:��(���H%�#	���w�J��>��4Ə���q�����G\���;��D?h��K���<��]Mm�s٩�:��g�KR�0~�� yN��B��Y��$�҃$uB��!��f�0�---6$���8z<]�y��0��i������)Y�b�q&a|��r�a6N�NA"�	S�]���b�����=���Z|#��vn�Qm��n6�bM7N��,N�R���E���	���`r��0��n�q���nF���RC?#�0�F�pӈ�L��aG���.a�X���'�����(�[��1S+��j���0�Y��0�#-��O�d�R��|&K�S���S�gߧ	2jqo�����9��D`A��pe��m!:I$���c�Z��ѻ$ݩ�XOi���:vqU*�����E�'�a���8s��U��h�14s��& �ؗN����85����N�uK�J3�?>����F��L���ם�xb���w���z��aa���-.~I�#́���0M'�
<:�Fe8㑅.��j'�
������]�UB���b1�d!�g�@�#h�1k#1���Ym�Zo&mH.�:*4�+��r�|+}��ZA�h�,1�䑦,@�'~���R��t�<T�P���?�`9+���w����	��T�w����7�hR+�Yf�;��	��%�S�h��IkX�a��� �&�QJ�Ob�ծ�K���9��c]�䪆I|ٛS���g�'82��@�U��Y�p�$���t�j�!���������T���+;L�/+����w���O%�*�5�pq��a�bm`��H�=�xX6�
�
��!	�a�PKQ������`c�'{��k/z×nl�Y߂�l�����B�ڑ�`/�q��h�<
V9-�Il6�n��i�5�=�(��K%�q�L�Ϊx�#�OZ�Z]=AFXVh�r�oTł1��nT�%�I:�9�QL�rT�s�*��2sیG��[L�P��=�LM�Mէr�I:T�Q�xg޻{��}�~�<���ԩ�1�n͇8�gM+�{��6����ڞ�3�-���r�''�	P�0I���p��%S���ǯRB��r�Կ��KX�tu�:,Y	2��(��ExL���@qa�(i�t�`+���(R��E`�k'P�H���릲ӛ�w8������@����[����!�1� Fq�o�^W�1���h�KQ�K�"iT��T�g-T��~t��G�
�����ȶ�^�ʤ���d�
aY3����O~��L�𕻙RGǬ�����ARU]��Q��X�}l�I����!��'�;�����E_ (2!�}� \.�A�����0=�lE�TTq�8�}3,2L�m_�	 ��n>�:@7�F��J`���jE���)&�~���k7�u���rC�7��s���9��,��SyHf)L-��H 	�ă�7K���b	�����ڷ���>WI����f\�&KlsR3q����#�n���U��^���y1>���|�5Nq�H�R+�I$%�2XQ��t�_-��[:���y#K#�Z3�ᵳb�Wm��ь��&d7J�Ob��^#�p�O�Ξ��~�d��AG��ň��l���_�%>6�G��,O�Y�0l0��j5�>~�9��ГQ�4�DЦ; �_L�B�;+!z&��1�I2hڔc�UCl�d�,�k�UI+�F���w��YĤSGZ���ǀ:���wxԒd0��M����#l�q #"���� �0R�hT�g��KDv�m�.�ݕf&�kZ	�"��4dxдf@>�
��z��p,���v_B��t����W��,-T�Q�%6K�@w�8Q��]"I�#��e�g��͝���ڲ$�>,N�Ď)v�In�RF�zƍLݝ���.�J��a$^ �.��ʃѴ��3�� �
��B$4�:x�,j��[�6�%�A��hj�QY~a�;����5L��,%�\q�:�ê�T�Y���컳Œ��Vg�
L�DD6F�	���JزG�y
Edx��q������7�&H�&j!E1�$|���
���L�����H�DdA�k�Zd�c�R�hU��d�F��/
k�2�ʦ��,,*[�cZq>�B��Ԏ�J7j!�܆2�F����s����FV��<? r�x��s���<��4�W�V urw=�)��̚��	��$����gBN9D���|cf/r+2h�����P�����Ҝ7������̝E�r�b'ZD"��D3	_���%0��j���/���� �������x2�n��of��:X7��$����W�"q�U��!�崒��F�FP��Z�-J��;*�%�����Q�(V*�v
s:|��`�d��*�[�&���tȏo�x������y���	q�L3�AX��$�����������@W��N��E�:+Y��r�*X٤��b?l3p*lm���C3ِe�T^�Q�����7�ɧ�5�o	���"�c�!I H�x�5�qmn���~����t!`	$,��W�E}ʩUT�Z�tu�L�r&a�<�C�L���GUI��#N�TR�M��ܜ�c8U�S���G:��]��_jI�v*�kZ�k`������gYܺƪ���-[�.K�m��P�������3AcANXP�A_X.I}�8\�]�ca@49䣠��t:Ќ���M���.�`�6�CSږ����h.`%
0����:�� z8���ևh|�@�﹂�>S2
¡^7D����-�����8�D��|�l��*T(��̌ECD�Ƈ�����첦�I-%J���Bn'�@�fi�-�90���Ej�l#�m��mTSlA�0�"H�x�>�p��փ�'����R�|�YN���[�Z���'�!�� �$���p�H���Be����2s�X��X
�?Z"��#��rE8P�#�ΐ
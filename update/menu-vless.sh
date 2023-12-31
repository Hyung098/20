#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'menu-vless.sh' encrypted at Sat Aug  5 23:25:12 WIB 2023
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
BZh91AY&SY�ss  6���������������aE��  @ � `Nt��}g�[ޫ�8�(UAV��4&����l��4yF&��� ����d                 2�5O��iOQ�h  �     � � $Jb%�i�@4   �@hɠ 4H�R���$�Si���@����  h��@A�Eh	4zd�?T�CCP��ji�=#C&�4ڞ���"�ȁ�����=U߭	bsi���{����2Hd����O��dc�]��S�⪉RT����L*bXM��!�U�aT2�@�I�J��")l�x�Bkx%@�R�E�k0a��b)�Չ�iM��P�Md�\��D����Bm��ne0�F�Vfҭ�Ŗ��϶�M ��y��;�j�T��P��p�j����� 
�����cF�M�7�R��?<g3��Z)	�h#8T����!C��4��	V����Ȯ����I�0L��a��9�nY�v�gA\�K|�SY���,`p�����AO 1�t\�{g d� ፒ�pNq)��e��I���ҹM�q�HAt��j X5vr�e4�"�)�&�7Ȗd��ɘ�(QP�hsۋ,�h$�����l�������,H�l	�Ŝ�_I����WlG0B��1Q�<#*�X���M@M�9ïzm
65���Z����n�U^�D\"	YAMre����k�d��`�ꪱ��Tb�LKh�3J�s�&���M��泿�H�Y"��A�e1E.r/�׷%U08�5H�;��K�'5ޤ�� ͌%|��m�GYD�[��R�wIB)-�qIx���5T@T$���aQ=����I{����i>��ʑ���C1���[X�Lm���!1;�AccH�~��+	Ƙm&V��ŘM�ɿ {9WѮG�̫y�I���&0xH��282�	20d#M��Y-"8�Ȋ�Їa]L����7���7�p�m��P�\$�c!���sk!��ϭ� `�>=�����`�0�BM�qD�Ѽ=!�Ԧ����s����e�"ҴN�S�W�%��$���Ts�F�7�3!p��?6�7�k� �XI�~�}��hqun�
�d��!�+*b��8خ��s��a��݆1���[��uH1�$�$0Fr+�2���a�i�بm\l�^8s��� �����|�q��k��E,��c����؈�r�b1�fHR����Q�Ih�$�1 �!�:a�@��(D�ڦQ��WMd�����,�11mF
���*hD�1:��oNJs�N�SB�s�h���Κ�~D�`�k���L0�ˌu��ޣ�Q,g_��F�fZ,էR�d�䶽�(0���D3������ᰴFY���ZcI�_�Uk^��zL4�kQW����kw~r�
�;
�����K3�y�hZ��t�Pר�!�V�P�	��x��AA&���u$m�2�@�.�J�ϔ�
E�e��ckW�,�릴%�/b�����E�=�D=t�1
���8i�g�������v��ّ���1���U�F�1U�����if�c��_��h^kB�6��)��ĺ�rվ��j�x"]�r�1�^�~2[)���d'�A�����.�B���>B��gN��)����gׄj��O������l��,�@�H���"�m�����p4���6cj�ѥX�l�z����݄ς�cG�ދ>9ZD�Q�A�3 �p��VF�j���)\������c	#�'G,�ڍS�iE59G��P ���`�"(�X�cS��YoG�ap\s3^���7\�&j2�iRh��%-���R����1� �CA�h<P �+7 �N��<X5�ؕͱ���"��}�p"
0Ep���� ���2}�@�a̠w�܃�&@@��_�iC�f�>��K�z�@7��#I�<��K��	3}g`t� U���i6~Ӏ��
�f	U���1b���S$*J)S$�~FURW�],���Ӡ�qx������3I�9L� 3)�i?O�$�S��Q�X�z��ݒ�ZPr(�x�?�$DSp��BȈ�=��b	+Z`��q��Ss�pԑ�H�Ԡ&���k$-l�Ϣ�$�t��*�ŗBh�_"�����j����v툫}�N�%�/ j*㭥Z:�G%��̘�����YqzOPd�E%0�x�7���Ji��*���1X~��B9��V]��P_�cB���2h�`6���}n,�ȅ��^��0л� ��_`��i���j�Z���4�V��`��A��CTN(�#��%Aen��-7Oza<ip�cmjF��#�@.V4DS~�+� �1��AaNh�1BW:(s�V�B��Il+�&��X�W���h�t���B��ǌk��3@�b�F��F\���fTA�x�@D:���r
�$ѵӥZ�.�E#*�������A�@%01�S�ULeE���V<m�i�^�[I��%٘��Q��!�TR���+h4U(0RbsI�Bm��`1^�}��@�I#�i�����m�1Z���y7���sd�!�*���A3��
��e���i��H�/�yO�A�\
$D�`C�0U@�]����a���"�(HV9���
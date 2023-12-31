#!/data/data/com.termux/files/usr/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'menu.sh' encrypted at Sat Aug  5 23:25:22 WIB 2023
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
BZh91AY&SYft�� M��}�p �����������PD@  `�;���{zwd����x��X=��փOA��lBI"z
O�4ѡ��S��x����MOORz����� $�	�0�'�ML�Rz�e��F����� h 4�@(Ѥ�&i�4i7��A20	�ML����C!�����	ɔ��j&)���ޓP���OP4i��� �C�~�b�ڍ4  42 4 �  d  �@@Sbi4�T�Sd��3��==S�@ �P4P1I���a��Ϛ�A��{p�n#��G}��k�z�]m�3D���8\&��@G}�˘�{)��Sɚ0���t���0���A��֟Ɛ�0�V���ۉ�l!�HA�q~�R�M>���R��a/b!ܴ�2-N�l���({Yq`|���o�ݠ�|���O����P��i��׵� q��ػ�,q�G�aO��1��Ţ0J�E
ZB�����=�Y��-���_�N%^�I�����L���Fۜ~¾��_3�[2�d1l���?���(P��񤅄�l�H�t�/:*p�+�{��#~{��篆\Ų&i�pɥ��F}��'gr��>�~,%8[V��8B�fs/���a-c�8[��g��Le���R_���.��Ӧ�ܝڡ�c�hg��jm���l�(���ja�|�vp�����.p��	�g�.��py�7�Ǧ��Z��Y�{Qm�"� i��Q� ,��紱_#EX�"�%�����5PK�nZ.ȕZ"���E,j|��,�.����������Wm��<׎��*�}��6�	p�3mr�i>�aņ<���ol���8s3 ����:0��7�X��#kO6�Ega�!zH?�/{���ZΜ����@�^��=A`�4�`�&t���P�cf�B���h��p��p�z)�B�����:���� ��w�}����	�(X�����V�YA8�uft�0��g1�_����{���2��ҷ�f���x�-	����Q@ds�ӫl�4�aVZ9�{��M����5lp�~��T�w�-���y6�o�by.b� u!�A�a�t��:md�9Eʤ�[$�����Ҥ4x!J��`K�ߒ ��ə稀u��$6&�Y�XH���ך�;\��]J4�L2��~��(��n`�<�N�3eTӳ=b-�̈2Ϳ	��QZX�S��Ρ���[������ʲ>�� ����	�7���d�b�6�-+ImM!L����Mx����p�H�X�Dx�(�a��m�P�������I��j��G�|���m���5�S�|�=�F�W�0�2�>)FTՉӎ.s�@HB`0g	
��xHA3�5�'�Vl"�͔�j}����`�I^�7�jL[:�%�B�A5�5r�H� 8J�2NQ�UNW�}S�
������;[{���W����v@A��)��g�D���pJco~i3J��|+���i�R���*�bӄ�E������d����:����ˏ+�t��?d�ء��?8�Fi�Nr"CR_	g��r��bᦁ�Rd����������|�?�V��IpKz�r+�����d.��I�Y~\��g���w:��t��G�j/q̵�X�߲��Q�."F���K���˅M�(�lД�I�bu��K��m�8�b�`D�o�ɱ����©��H���aI�rrd�K.�^���S"��R���8�
�9cBS$��ǃ�LIX%˯��:��Y�z��7f�jT�$;Mpǜ��a[/`@��7�F6@��S�e%�!6�k&2���lܐ�F�1���� �(0,L�R�S�}Sie���a~��q�"�9U͍�����P�.�+��ߛ:b\�b?,��j���REq�s}��7J��Xv�뇁�FU6�c�⾹F��]��S^�"�W]Hn3�.$��%�רl�����bEx\��Y�!��X�ݻ�p"
:�=yy���H�e	��/�\�c����KMr��ux;M1��j9V�.��%�%Ê�h��u��NΒr���	��C0u0���� ���D�/��E"Ais��8���N���:B��5�3�п���.dU��!�jJh�To��+���Y�����p���0��bv�a�Ȑ|f��ޢ����&�i��Χ��5���jҴ�)1
Q�6�M�-:�ԫ��,M_�U��!GԶR�6�\�`�&VFmn�G�o�+\�"�2Z9,�1⿨�W�f^�ń�.8EFy�`�j՚8�du���32����<�ײⴅ����J/,I�_1j79�+�S�OAQ��XGO`���K�_�"�3	��h�p�T7���$]]���n@�*ʖ��|��oܮjڅ-�+��h�al��ơ�@٢�7�֕�j�sT�8�|f�ɀJy��hֺ9�߿:�x���Jga����Ґ�=�pl�(�]�LckE�l�觩��p��0����!��5���>N�]>Iϻ��K��5D��3�3���m���H��U�R�D�j��^a�N��:�/SR&UGqb�bRG�L����ir�YŇ��1 �`4.��IXj �a�|�EI�%;ڿ7g�1u�$v�</�h��g!r&+�3-�a��k�Iy#�_smh]�Q�ٹD�A�G�x�3r�"2�|"ܛ��a����55,�D���3��	XR$P�r�Z*o�T�[gJ�|�%��j�sV��^ �KI��L�l&�	&�j��0��`���V��Ŭx�9�R����B
$MR�p����?@���Aq��Rҝ��a���>��T���<��7=��sΦ��­^����WdS+�%�cΚ��V���sD��|$�Q��):2Q%:�S�1Y�
[H\��f��.@�b���[hʶ^.P��"�\�Q>m�
�}TL�L��ȁYJ���sw�5�U�j��m����S �͋�-�B{��u������r�w/���+�����%��"va�*&u^6�i��@��c���wE�~JtH��� ��gVc�Q�=_6pI
a@�H+��9�8Z��mp���ؘr[��� $��%�H�+PW�"hsI�'D��}���L @ H�j��"��( =��DH!( �6  �`0�]��BA�ҷ�
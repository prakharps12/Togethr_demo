PGDMP         &                 |            Secrets    15.4    15.4 !               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16421    Secrets    DATABASE     |   CREATE DATABASE "Secrets" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "Secrets";
                postgres    false            �            1259    16502    laptop    TABLE     {   CREATE TABLE public.laptop (
    id integer NOT NULL,
    pdt_name text,
    price money NOT NULL,
    description text
);
    DROP TABLE public.laptop;
       public         heap    postgres    false            �            1259    16501    laptop_id_seq    SEQUENCE     �   CREATE SEQUENCE public.laptop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.laptop_id_seq;
       public          postgres    false    221                       0    0    laptop_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.laptop_id_seq OWNED BY public.laptop.id;
          public          postgres    false    220            �            1259    16485    product    TABLE     |   CREATE TABLE public.product (
    id integer NOT NULL,
    pdt_name text,
    price money NOT NULL,
    description text
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16484    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    219                        0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    218            �            1259    16456    search_history    TABLE     �   CREATE TABLE public.search_history (
    id integer NOT NULL,
    search_query character varying(255) NOT NULL,
    search_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.search_history;
       public         heap    postgres    false            �            1259    16455    search_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.search_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.search_history_id_seq;
       public          postgres    false    217            !           0    0    search_history_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.search_history_id_seq OWNED BY public.search_history.id;
          public          postgres    false    216            �            1259    16434    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16433    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215            "           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            x           2604    16505 	   laptop id    DEFAULT     f   ALTER TABLE ONLY public.laptop ALTER COLUMN id SET DEFAULT nextval('public.laptop_id_seq'::regclass);
 8   ALTER TABLE public.laptop ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            w           2604    16488 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            u           2604    16459    search_history id    DEFAULT     v   ALTER TABLE ONLY public.search_history ALTER COLUMN id SET DEFAULT nextval('public.search_history_id_seq'::regclass);
 @   ALTER TABLE public.search_history ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            t           2604    16437    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                      0    16502    laptop 
   TABLE DATA           B   COPY public.laptop (id, pdt_name, price, description) FROM stdin;
    public          postgres    false    221   �!                 0    16485    product 
   TABLE DATA           C   COPY public.product (id, pdt_name, price, description) FROM stdin;
    public          postgres    false    219   �!                 0    16456    search_history 
   TABLE DATA           L   COPY public.search_history (id, search_query, search_timestamp) FROM stdin;
    public          postgres    false    217   �8                 0    16434    users 
   TABLE DATA           4   COPY public.users (id, email, password) FROM stdin;
    public          postgres    false    215   �9       #           0    0    laptop_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.laptop_id_seq', 1, false);
          public          postgres    false    220            $           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 1, false);
          public          postgres    false    218            %           0    0    search_history_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.search_history_id_seq', 10, true);
          public          postgres    false    216            &           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    214            �           2606    16509    laptop laptop_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.laptop
    ADD CONSTRAINT laptop_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.laptop DROP CONSTRAINT laptop_pkey;
       public            postgres    false    221            �           2606    16492    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    219            ~           2606    16462 "   search_history search_history_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.search_history DROP CONSTRAINT search_history_pkey;
       public            postgres    false    217            z           2606    16441    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            |           2606    16439    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215                  x������ � �            x��]�r�Ȓ}���^�a�%��~��D-�-J�"-�;�S%c` �lu�/�O�����&��X
Qr��% �Ȭ\N.%��N..P���;.A����O��წ~B�譁Ύ>�X���p￑�9�tDA��]gL<�q?�7��Cv��#�#�Hd����ޠ������R%���b�`O@7����w\�|D<�׻Q�;x4}�'�3לO����F��9�{����>���������ǿF�ѩe?w�Z��n�yG\�,o>5�>"�":=�G�o�h�.�Ժ'h�,�ti���9.\�$UD���Z{d:Eݱo=tMl!�
�ׂ�Fo��kd$�����ٲ��]�	P�E�'�'3E/��.��������Ɠwl���%��� a�.��=�'�^��5$�5&�8�7�\�F��H�J �k������1��U���U�@�P�Px�D)�\��������3�a������n];?�"qr{�Lߧ��H������	]ib~g�l�it!��sls
�h>�)q=�9$��>�ۗ��89�����B)o-�/Y>�h'c�,��!.��{K&vMbԫ��c#��h{�+w"E���]����}��零��N5���U<T����drwe[��iڤ%�-;fྺwAl��A_�i�;衛�?�]�}��V�E����3������Ui,����(��e+z����}�X�Y�}�����;�.HwϜ���+�ɘJ��VG��e���XK��I戵��۩-�)���d��"K_��`��RY:G��W��D{����~|B?el�KL���$��I��4pý�iIN�˘�%�z+���.ˬ�Db��:ک��΁Zŵ��\�'(UBʰX��%�J��2V:~�4�@��f�c;�坜��S��F�S���b�չ�+3;���ի�{��;3�L���Z[W�TG��ҁ�I��/k�'��a,�}�_�������8��-F��bf���v�S�	5�G��#��/�'�����͛�ޥ���(���k�P2��M����fXSF������-���\nRj|�nn��.Ӿ�Y�z�q��5X�=��O����:���}��t�Mxa�}g����R-Ԏ�:�/'��^w�i�n�p�Q��U�Oo���0�Jk�̯͊Z91o#��5vρ�Bf�@V!0��3�K�4�mLK)����y����j�Fj��j�;b^�`m���_�"UC�v�E����r�ݗD��^����-�W�V�|Z�0�Q�Ld���r�L�p����c����:y"�	NP�՟���$�����k3x��֥�vQ��k]�U�1�EЛ*����t�]ل�uU�־$S��Zc�V�DS�4��N�S��1X�kF'�k��D��R�4��5�\��U�g�>��TP�j���=�;q�O	ʬ�j0��A�^ά����%�P�������V�O���%9�O�/Z�>-',��U ��3�*S��!��q��Q�j�\2v��|3�؇�����,fsχ�<���j�W��%�P=�C�a�nh[`	Y�פꊅ'���rڑ�Ɋ8O�ͬ��������&�����j71"J�3�I��<K�և����&M@~�;�v\��6%��z� $���_��>�0|T �",HYDt���S���>���K�j� P$��j�27�>���0���o���;`��W;Ab�'�xJ|�=_�' ��7���F���P���]����K|I��H~y7Y�H�I��D�Y��z�����#p�J��(L��z�9���U��E���L��F;\�N��Y\��A���G���|Vn_��Ҩ����0[,8�}��tk%�V�p����(��4��3B�N�+	�:k�f���7����&1F�HŘu�'OO� �YR������$>�eD-���_\T�=�jX�ѝ��Q��&�Qb����u�qJ�ZE�Z`cWt��m��Z*4�d48o�R^C}��������eQ7�0��ʨ{3�ح +����\�g��U9(M��x��R��ssJ�8q��)8��?6�ܬW�FΓ��,r��x���V�r�6�Q�|b�k�@B��'޾ZQ_�C
s![A
K�n�^X3���ŵ;�P0�]��� -�������Y����t_mٹP�`y)%�e���RJ
א���u��#5�A'��M9�+�7��Q��I'Z�8 �kj5�Q��ȝ�(���{-�#ZX%:��F62=���H��%U� �|]���즹ȱ����Tߪ�qv6�Ȳ��n&eK��D��>�F!���P(�yQ���QAX*@k�j���$��E���.�ނ���Zk[]_������������f�7bkJ��i��;��'e[0p��έ�$�(��ѓ29m�hԩ�M�fz��T�i��@Y�WM�o��'��8	{KB��CB�N�9��t*�ۦJckl4Xxإ�J2(~*�В0�Z�B��6����\�Q	?:��H�K�k��B��������Ř6�=X��AD� S�T̴PX�fv��^��AL���SۺX���V�8��s��qK?W@��BA�iB�w^��D�p�9�F��Ĉ�z�/��XOcD]�Vvw���Q�Rm�x)
*��㉪�r-iI�	��k���g�����|k�D�+-���Lu�3�]I�����%5�v��n/ocu���
�7[u�Rf�h_�޾�hG+�ܮ �ִ�,�5bEFK��8Z�	��P��^X'#kQ0�$��vbex�i%iѣj0�{�zW����>won���/��Z�~�
KCT�B��	�ZS�+�$��V�#Rχ~z��[��'_�jȺ�Ɂ�Dw�G�oc�$�xl�z`�ٙFt�� ���$Ac�7�1F����xBJ��P�?����wES�>���~��Eg'�W7�'�f�;�EUDo��3��/��u���3���<t�Q�,T�a��)FB2�M,�c���t˔zAS,��Z�9�h���ޔ���s_�CA\>�P��/$�/eAb,B��99<F����C:��/̩�f��Z�R�n�S��B*<�7��'M`�1��t`�?>�ļ�O�xfָl�Ӷ��f7��v�0ZY{�X��E�1��{r��$5٧fq�
v'�WC�1>̮������f�a�w�)b~�T�\ĕs
|#0^M��#�u��i�����c�r�z��a&P{����� p[�S�B�K����>uw�q����h�AZ�:ޤ��65�#��	�Ͼ�����/�̶��K�{�^40���N�1Y3�~ kg��9�Vf���&�[�J܀��.�F�߱9%��	�; mcڸ}*ܾK����'���������ܚ>��"��O����GU�s76=z�S�'<�I���kx-��d����_���X�)�v�Y��rÓ�8>�$��b�v�9 ��쨅:�k�ٹޔ��i��ƅ����±&-���J���C=��A�!�Y��e	��4z��6�0-R;��2"e���f;L;��M8I6�ҾLY��ۄV�n"����	^c�NJ1�$-�Nu�b�3����gŰ�I>W�Ŋ�ޮ�Ű�����|���������!�=��xbQm7=$I�4�!nZ������,�-�skX��}-{g���ї�	:��T�ڴߧ�>��t�N�B��R��#6>�O�<�kMEęSp9c&��Z���r�K<����t��{�=d���ȟp�p�:+�
HQ�]������`d����fG����z�n��y�tD�|B�!�O���) >0}���Pu�ӇP�s�ǎu;���n���(��Φ���S �Ҝ@x>�7�>����0���N�%�ˆш�3t�D #0�t	F��F3��5{��1���fj|�(UnQldrpC������괟r�a}�����-�Oa�,���\�;l&�F>]�Q�,&%_I���J���������ʁ�4ٱ{eL�;�u��A펶}=S�U�@����Պ�I��T�S3+!� �  �b\�P�#G�j�9%��y�x+���y�ҶR-3��m1��u�n
��S4y�<T�7k�XF57��$\�ٯ݆��*�����u8`�m��\�㿻 =�pc��by�}S#�8eC*���?�@���ꂾ�J`�BBP;tr֟�]��Ο@( ��#��`3<}��ᝠ�5'�0�G ����	���)�ؔ�oA,�ܣ9X�~�)UԝZ�Tر3�ђ�q� /���'�=���C���@����57^�Q���TEuˀ�L+�a<t�s;^�(��N�;'���bM)w���`�QOf��ל��o..+����R�`�p���Oԅot�A^����O"�-�� |��䰜��;3�{9V!YXֳ�{�Fǈ����p��)��ƺ���V����~�3Bk%53[��ލ�z�gT�r����̐,i�2۴�b9;�˰^1���;|Z6'��Lb��ZYOؾ�M�y���}�h姎Fd<��1l���.]σ�N�gxsZ��g9�G��4T��0��xg~L�`ܽ'��>�NJ9�	����OV��������/��v�k���F�x�9YJ��.�8�HzR���A��`;N4Rd6�	����حLxy�]/�����t��ץO-tX kT������O�7��)Ǔ������6��X1��ol(��S�� �w{��X)��e�p4�|��W�`���B�hj��m�ioj�'N��0��/jrll"�j��v����X�8㮰�;�Rnv��>U������f��-��)�(�����:�����K4D���ܣ��E�/׌�����t���yNX1��������r�R��xO>�1S�`��a=�!QX苤�Q���4M�T��a3T]AV�A�ܱ$)X8�W��[wU���E�
��s'u��[�*J$Om{�i�x����q�)�w�D>�Fy�ܾܡĚZP��9��d��칡�Ю�ZG��JC��4������;�_]v/���_R����T�Z�f�́+�r`�BIb��Rd��eG����e-Z��w� �tFU�.�����F��3�^�j �%q�ag��P�������KD6��Ih�d�Y'?�SX�y���M��,�����N|�8�5G�=�1XKw� P�Ә�r�O��U�����;ϜK��� C|�Vm��?�kr��A�,��:�Wi-y� c-5�"4�)E�V�+�p�LݐWSۅ�����5�n��X���<�5l�|��V0�����E�C�\�$��eA�{�L���I�"}ss���+��&�+}��IBG������| ����-��������0��� S랰}��$����t
N�o=�'N�d* ��,|�ʁ�Q]D��!���)�ɼ@x�EG���-����,��Y2��C 	�G��g�,�}���[аG}ͻ���)ۙ�Y �F�(7.���(W봫�(����]l2��/2��b4=@��C*�ޱ+���+b�}�t�Ҳ�2.��Uk,��O�um�n��L�gM:�z��Z���X{%���i:�
��;-!�U)�
Ab�*��|qU(n;*��-�;.u��&d��|�T17����f��YF������$����*����P��<��E�<���X=��!̆^`Os�˻:�
�$���5�� �����u�|���)�eZ8�#v�9��*�3��u�Ԧ�Q�;�S��j�t���V:竰�������         �   x��ϻjQ����8/�f�ϥ�)��*]�B�0��d�T��,��i�����v���f5�$$�"^I�]��y	. i=�c>L��<=�ޙP�Y�u�,ؘB�V�B���D���o�qwC3	��[!����%O�a���<�;c,5}�r�×����8]�Q�+0-��s���=A�^-���:[3         0   x�3��H��M-Iʯ�*�42tH�M���K���4426153����� yZ     
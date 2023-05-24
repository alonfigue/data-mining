PGDMP     2    1                {            Data_Mining    14.7    14.7                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16770    Data_Mining    DATABASE     m   CREATE DATABASE "Data_Mining" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Venezuela.1252';
    DROP DATABASE "Data_Mining";
                postgres    false            �            1259    16772    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nombre_cliente character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    correo character varying(30) NOT NULL,
    domicilio character varying(30)
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    16771    clientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clientes_id_cliente_seq;
       public          postgres    false    210                       0    0    clientes_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;
          public          postgres    false    209            �            1259    16779 	   productos    TABLE     �   CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre_producto character varying(30) NOT NULL,
    costo character varying(30) NOT NULL,
    elaborado_por character varying(30),
    existencia boolean
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    16778    productos_id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.productos_id_producto_seq;
       public          postgres    false    212            	           0    0    productos_id_producto_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;
          public          postgres    false    211            �            1259    16786    recibos    TABLE     4  CREATE TABLE public.recibos (
    id_recibo integer NOT NULL,
    id_cliente integer NOT NULL,
    id_producto integer NOT NULL,
    fecha date NOT NULL,
    hora character varying(10),
    dia_de_la_semana character varying(9),
    cantidad integer NOT NULL,
    modo_pago character varying(30) NOT NULL
);
    DROP TABLE public.recibos;
       public         heap    postgres    false            �            1259    16785    recibos_id_recibo_seq    SEQUENCE     �   CREATE SEQUENCE public.recibos_id_recibo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.recibos_id_recibo_seq;
       public          postgres    false    214            
           0    0    recibos_id_recibo_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.recibos_id_recibo_seq OWNED BY public.recibos.id_recibo;
          public          postgres    false    213            f           2604    16775    clientes id_cliente    DEFAULT     z   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    210    209    210            g           2604    16782    productos id_producto    DEFAULT     ~   ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);
 D   ALTER TABLE public.productos ALTER COLUMN id_producto DROP DEFAULT;
       public          postgres    false    211    212    212            h           2604    16789    recibos id_recibo    DEFAULT     v   ALTER TABLE ONLY public.recibos ALTER COLUMN id_recibo SET DEFAULT nextval('public.recibos_id_recibo_seq'::regclass);
 @   ALTER TABLE public.recibos ALTER COLUMN id_recibo DROP DEFAULT;
       public          postgres    false    213    214    214            �          0    16772    clientes 
   TABLE DATA           [   COPY public.clientes (id_cliente, nombre_cliente, apellido, correo, domicilio) FROM stdin;
    public          postgres    false    210   v       �          0    16779 	   productos 
   TABLE DATA           c   COPY public.productos (id_producto, nombre_producto, costo, elaborado_por, existencia) FROM stdin;
    public          postgres    false    212   �                 0    16786    recibos 
   TABLE DATA           y   COPY public.recibos (id_recibo, id_cliente, id_producto, fecha, hora, dia_de_la_semana, cantidad, modo_pago) FROM stdin;
    public          postgres    false    214                      0    0    clientes_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 1, true);
          public          postgres    false    209                       0    0    productos_id_producto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.productos_id_producto_seq', 1, true);
          public          postgres    false    211                       0    0    recibos_id_recibo_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.recibos_id_recibo_seq', 1, true);
          public          postgres    false    213            j           2606    16777    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    210            l           2606    16784    productos productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    212            n           2606    16791    recibos recibos_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.recibos
    ADD CONSTRAINT recibos_pkey PRIMARY KEY (id_recibo);
 >   ALTER TABLE ONLY public.recibos DROP CONSTRAINT recibos_pkey;
       public            postgres    false    214            o           2606    16792    recibos recibos_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recibos
    ADD CONSTRAINT recibos_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);
 I   ALTER TABLE ONLY public.recibos DROP CONSTRAINT recibos_id_cliente_fkey;
       public          postgres    false    3178    210    214            p           2606    16797     recibos recibos_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recibos
    ADD CONSTRAINT recibos_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);
 J   ALTER TABLE ONLY public.recibos DROP CONSTRAINT recibos_id_producto_fkey;
       public          postgres    false    212    214    3180            �   J   x�3�t���+��t�L/M-�O�LLwH�M���K���t,�S0UHIU�*���WH��Sp�Q���IL/������ ���      �   %   x�3�tN-*K�J�4U��H��K�N��,����� ~��         6   x�3�4B##c]S]#cNC+C��\=N�Ģ��bNΨԜ�T�=... �
e     
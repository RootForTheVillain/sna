PGDMP     -                    y           sna    13.3    13.3      �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16387    sna    DATABASE     X   CREATE DATABASE sna WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE sna;
                postgres    false            �            1259    16571    NetworkProvider    TABLE     o   CREATE TABLE public."NetworkProvider" (
    "NetworkId" integer NOT NULL,
    "ProviderId" integer NOT NULL
);
 %   DROP TABLE public."NetworkProvider";
       public         heap    postgres    false            �           0    0    TABLE "NetworkProvider"    ACL     V   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."NetworkProvider" TO "sna-db-user";
          public          postgres    false    206            �            1259    16396    Networks    TABLE     _   CREATE TABLE public."Networks" (
    "NetworkId" integer NOT NULL,
    "Name" text NOT NULL
);
    DROP TABLE public."Networks";
       public         heap    postgres    false            �           0    0    TABLE "Networks"    ACL     7   GRANT ALL ON TABLE public."Networks" TO "sna-db-user";
          public          postgres    false    202            �            1259    16399    Network_id_seq    SEQUENCE     �   ALTER TABLE public."Networks" ALTER COLUMN "NetworkId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Network_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    202            �           0    0    SEQUENCE "Network_id_seq"    ACL     @   GRANT ALL ON SEQUENCE public."Network_id_seq" TO "sna-db-user";
          public          postgres    false    203            �            1259    16388 	   Providers    TABLE     X   CREATE TABLE public."Providers" (
    "ProviderId" integer NOT NULL,
    "Name" text
);
    DROP TABLE public."Providers";
       public         heap    postgres    false            �           0    0    TABLE "Providers"    ACL     8   GRANT ALL ON TABLE public."Providers" TO "sna-db-user";
          public          postgres    false    200            �            1259    16391    Provider_id_seq    SEQUENCE     �   ALTER TABLE public."Providers" ALTER COLUMN "ProviderId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Provider_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    200            �           0    0    SEQUENCE "Provider_id_seq"    ACL     A   GRANT ALL ON SEQUENCE public."Provider_id_seq" TO "sna-db-user";
          public          postgres    false    201            �            1259    16455    old_customers    TABLE     c   CREATE TABLE public.old_customers (
    "CustomerId" integer NOT NULL,
    "Name" text NOT NULL
);
 !   DROP TABLE public.old_customers;
       public         heap    postgres    false            �           0    0    TABLE old_customers    ACL     R   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.old_customers TO "sna-db-user";
          public          postgres    false    204            �            1259    16463    customers_Id_seq    SEQUENCE     �   ALTER TABLE public.old_customers ALTER COLUMN "CustomerId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."customers_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    204            �          0    16571    NetworkProvider 
   TABLE DATA           F   COPY public."NetworkProvider" ("NetworkId", "ProviderId") FROM stdin;
    public          postgres    false    206   q"       �          0    16396    Networks 
   TABLE DATA           9   COPY public."Networks" ("NetworkId", "Name") FROM stdin;
    public          postgres    false    202   �"       �          0    16388 	   Providers 
   TABLE DATA           ;   COPY public."Providers" ("ProviderId", "Name") FROM stdin;
    public          postgres    false    200   �"       �          0    16455    old_customers 
   TABLE DATA           =   COPY public.old_customers ("CustomerId", "Name") FROM stdin;
    public          postgres    false    204   ;#       �           0    0    Network_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Network_id_seq"', 4, true);
          public          postgres    false    203            �           0    0    Provider_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Provider_id_seq"', 6, true);
          public          postgres    false    201            �           0    0    customers_Id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."customers_Id_seq"', 1, false);
          public          postgres    false    205            E           2606    16575 7   NetworkProvider PK_NetworkProvider_NetworkId_ProviderId 
   CONSTRAINT     �   ALTER TABLE ONLY public."NetworkProvider"
    ADD CONSTRAINT "PK_NetworkProvider_NetworkId_ProviderId" PRIMARY KEY ("NetworkId", "ProviderId");
 e   ALTER TABLE ONLY public."NetworkProvider" DROP CONSTRAINT "PK_NetworkProvider_NetworkId_ProviderId";
       public            postgres    false    206    206            A           2606    16557    Networks PK_Networks_NetworkId 
   CONSTRAINT     i   ALTER TABLE ONLY public."Networks"
    ADD CONSTRAINT "PK_Networks_NetworkId" PRIMARY KEY ("NetworkId");
 L   ALTER TABLE ONLY public."Networks" DROP CONSTRAINT "PK_Networks_NetworkId";
       public            postgres    false    202            ?           2606    16565 !   Providers PK_Providers_ProviderId 
   CONSTRAINT     m   ALTER TABLE ONLY public."Providers"
    ADD CONSTRAINT "PK_Providers_ProviderId" PRIMARY KEY ("ProviderId");
 O   ALTER TABLE ONLY public."Providers" DROP CONSTRAINT "PK_Providers_ProviderId";
       public            postgres    false    200            C           2606    16462    old_customers customers_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.old_customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY ("CustomerId");
 F   ALTER TABLE ONLY public.old_customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    204            F           1259    16576 )   fki_FK_NetworkProvider_Networks_NetworkId    INDEX     p   CREATE INDEX "fki_FK_NetworkProvider_Networks_NetworkId" ON public."NetworkProvider" USING btree ("NetworkId");
 ?   DROP INDEX public."fki_FK_NetworkProvider_Networks_NetworkId";
       public            postgres    false    206            G           1259    16577 +   fki_FK_NetworkProvider_Providers_ProviderId    INDEX     s   CREATE INDEX "fki_FK_NetworkProvider_Providers_ProviderId" ON public."NetworkProvider" USING btree ("ProviderId");
 A   DROP INDEX public."fki_FK_NetworkProvider_Providers_ProviderId";
       public            postgres    false    206            H           2606    16578 5   NetworkProvider FK_NetworkProvider_Networks_NetworkId    FK CONSTRAINT     �   ALTER TABLE ONLY public."NetworkProvider"
    ADD CONSTRAINT "FK_NetworkProvider_Networks_NetworkId" FOREIGN KEY ("NetworkId") REFERENCES public."Networks"("NetworkId") NOT VALID;
 c   ALTER TABLE ONLY public."NetworkProvider" DROP CONSTRAINT "FK_NetworkProvider_Networks_NetworkId";
       public          postgres    false    3137    206    202            I           2606    16583 7   NetworkProvider FK_NetworkProvider_Providers_ProviderId    FK CONSTRAINT     �   ALTER TABLE ONLY public."NetworkProvider"
    ADD CONSTRAINT "FK_NetworkProvider_Providers_ProviderId" FOREIGN KEY ("ProviderId") REFERENCES public."Providers"("ProviderId") NOT VALID;
 e   ALTER TABLE ONLY public."NetworkProvider" DROP CONSTRAINT "FK_NetworkProvider_Providers_ProviderId";
       public          postgres    false    200    3135    206            �      x�3�4�2bCN# 6bS 6����� 4Zt      �   :   x�3��K-)�/�V���2��\򋹌ἐ��b.8ׯ47�(_!�4��(�+F��� T#�      �   A   x�3�t)�Sp*J�+�2�u�������n��\&�E\�`�Y���������f����� ��4      �   )   x�3��/NN,R�HM�)��2���,IM��2�\1z\\\ c     
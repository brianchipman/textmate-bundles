FasdUAS 1.101.10   ��   ��    k             l      �� ��   �� paste.applescript
 * 
 * Created by Jacob Rus on 2006-05-26.
 * Additional work by Allan Odgaard
 * 
 * This script sets up a list of options, allows TextMate to paste the
 * selected text to a paste bin, sets up a list of possible actions to
 * perform with the link, depending on what applications are available,
 * and carries those actions out.  Some options include:
 * 
 *   - Copy the URL to the clipboard
 *   - Open the URL in the default browser
 *   - Paste the URL to an open chat in Adium
 *   - Paste the URL to an open IRC channel in Colloquy
 *   - Paste the URL to a chat in iChat
 *   - Send the URL to Quicksilver
 *   
 * Note that for these last two, if multiple channels or chats are open with
 * the same name, this Applescript will not attempt to distinguish between
 * them, and will paste to the first available channel or chat which matches
 * the user's choice.
 * 
        	  l     ������  ��   	  
  
 l     ������  ��        l     �� ��    !  ==========================         l     �� ��    !  = SET UP LIST OF OPTIONS =         l     �� ��    !  ==========================         l     ������  ��        l     �� ��    N H get a list of open applications, so that we can decide which actions to         l     �� ��      present as options         l     ��  O        !   r     " # " n    	 $ % $ 1    	��
�� 
pnam % 2   ��
�� 
pcap # o      ���� 0 openapps openApps ! m      & &�null     ߀��  �System Events.app�]���԰��Ӡ    }p   )       ��(�\�x���� ~sevs   alis    �  Ladybird                   ���BH+    �System Events.app                                                k��d�        ����  	                CoreServices    ���"      �c��      �  �  �  6Ladybird:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    L a d y b i r d  -System/Library/CoreServices/System Events.app   / ��  ��     ' ( ' l     ������  ��   (  ) * ) l     �� +��   +   initialize the list    *  , - , l    .�� . r     / 0 / J     1 1  2 3 2 m     4 4  Copy to Clipboard    3  5�� 5 m     6 6  Open in Browser   ��   0 o      ���� 0 the_list  ��   -  7 8 7 l     ������  ��   8  9 : 9 l     �� ;��   ; / ) get open chats from Adium, if it is open    :  < = < l   \ >�� > Z    \ ? @���� ? E     A B A o    ���� 0 openapps openApps B m     C C  Adium    @ k    X D D  E F E O   & G H G r    % I J I l   # K�� K n    # L M L 1   ! #��
�� 
AchN M 2   !��
�� 
Acht��   J o      ���� 0 adium_chats   H m     N N�null     ߀��  *	Adium.app��Ѱ   �]��bp����    }p4   )       ��(�\�x���  ~AdIM   alis    <  Ladybird                   ���BH+    *	Adium.app                                                       F���`��        ����  	                Applications    ���"      �`m�      *  Ladybird:Applications:Adium.app    	 A d i u m . a p p    L a d y b i r d  Applications/Adium.app  / ��   F  O P O Z   ' 7 Q R���� Q >  ' + S T S o   ' (���� 0 adium_chats   T J   ( *����   R r   . 3 U V U b   . 1 W X W o   . /���� 0 the_list   X m   / 0 Y Y  Paste to Adium:    V o      ���� 0 the_list  ��  ��   P  Z�� Z X   8 X [�� \ [ r   H S ] ^ ] b   H Q _ ` _ o   H I���� 0 the_list   ` J   I P a a  b�� b b   I N c d c m   I L e e 	   	    d o   L M���� 0 	each_chat  ��   ^ o      ���� 0 the_list  �� 0 	each_chat   \ o   ; <���� 0 adium_chats  ��  ��  ��  ��   =  f g f l     ������  ��   g  h i h l     �� j��   j 9 3 get open IRC channels from Colloquy, if it is open    i  k l k l  ] � m�� m Z   ] � n o���� n E   ] b p q p o   ] ^���� 0 openapps openApps q m   ^ a r r  Colloquy    o k   e � s s  t u t O  e � v w v r   k � x y x l  k � z�� z b   k � { | { l  k  }�� } 6 k  ~  ~ n   k r � � � 1   p r��
�� 
pnam � 2  k p��
�� 
dchM  >  u ~ � � � 1   v x��
�� 
pnam � m   y } � �  nickserv   ��   | n    � � � � 1   � ���
�� 
pnam � 2   ���
�� 
crmM��   y o      ���� 0 colloquy_channels   w m   e h � ��null     ߀��  *Colloquy.app�   �]��bp����    }p4   )       ��(�\�x���  ~coRC   alis    H  Ladybird                   ���BH+    *Colloquy.app                                                    R���{\        ����  	                Applications    ���"      ��_<      *  "Ladybird:Applications:Colloquy.app    C o l l o q u y . a p p    L a d y b i r d  Applications/Colloquy.app   / ��   u  � � � Z   � � � ����� � >  � � � � � o   � ����� 0 colloquy_channels   � J   � �����   � r   � � � � � b   � � � � � o   � ����� 0 the_list   � m   � � � �  Paste to Colloquy:    � o      ���� 0 the_list  ��  ��   �  ��� � X   � � ��� � � r   � � � � � b   � � � � � o   � ����� 0 the_list   � J   � � � �  ��� � b   � � � � � m   � � � �   	    � o   � ����� 0 each_channel  ��   � o      ���� 0 the_list  �� 0 each_channel   � o   � ����� 0 colloquy_channels  ��  ��  ��  ��   l  � � � l     ������  ��   �  � � � l     �� ���   � 8 2 get all online accounts from iChat, if it is open    �  � � � l  �< ��� � Z   �< � ����� � E   � � � � � o   � ����� 0 openapps openApps � m   � � � �  iChat    � k   �8 � �  � � � O  �  � � � r   � � � � � 6 � � � � � n   � � � � � 1   � ���
�� 
pnam � 2  � ���
�� 
pres � F   � � � � � >  � � � � � 1   � ���
�� 
stat � m   � ���
�� pstaoffl � >  � � � � � 1   � ���
�� 
stat � m   � ���
�� pstaunkn � o      ���� 0 ichat_accounts   � m   � � � ��null     ߀��  *	iChat.app��Ѱ   �]��bp����    }p4   )       ��(�\�x���  ~fez!   alis    <  Ladybird                   ���BH+    *	iChat.app                                                       A�d<        ����  	                Applications    ���"      �d,      *  Ladybird:Applications:iChat.app    	 i C h a t . a p p    L a d y b i r d  Applications/iChat.app  / ��   �  � � � Z   � ����� � >  � � � o  ���� 0 ichat_accounts   � J  ����   � r  
 � � � b  
 � � � o  
���� 0 the_list   � m   � �  Paste to iChat:    � o      ���� 0 the_list  ��  ��   �  ��� � X  8 ��� � � r  (3 � � � b  (1 � � � o  ()���� 0 the_list   � J  )0 � �  ��� � b  ). � � � m  ), � � 
    	    � o  ,-���� 0 	each_chat  ��   � o      ���� 0 the_list  �� 0 	each_chat   � o  ���� 0 ichat_accounts  ��  ��  ��  ��   �  � � � l     ������  ��   �  � � � l =P ��� � Z  =P � ����� � E  =B � � � o  =>���� 0 openapps openApps � m  >A � �  Quicksilver    � r  EL � � � b  EJ � � � o  EF���� 0 the_list   � m  FI � �  Send to Quicksilver    � o      ���� 0 the_list  ��  ��  ��   �  � � � l     ������  ��   �  � � � l QZ ��� � r  QZ � � � I  QV��������  0 defaultchoices defaultChoices��  ��   � o      ���� 0 default_items  ��   �  � � � l [� ��� � O  [� � � � r  a� � � � I a��� � �
�� .gtqpchltns    @   @ ns   � o  ab���� 0 the_list   � �� � �
�� 
okbt � m  eh � �  Paste    � �� � �
�� 
prmp � m  kn � �  Where to put the result:    � �� � �
�� 
appr � m  qt � �  Paste to Paste Bin    � �� � �
�� 
inSL � o  wz���� 0 default_items   � �� ���
�� 
mlsl � m  }~��
�� boovtrue��   � o      �� 0 the_choices   � m  [^  �null     ߀�� �vTextMate.app�   ��]��bp��Ӡ    }p   )       ��(�\�x���� ~TxMt   alis    �  Ladybird                   ���BH+   �vTextMate.app                                                    V_����        ����  	                Deployment (ppc)    ���"      ���     �v Q c�  k�  5Ladybird:Users:duff:Oak:Deployment (ppc):TextMate.app     T e x t M a t e . a p p    L a d y b i r d  ,Users/duff/Oak/Deployment (ppc)/TextMate.app  /    ��  ��   �  l     �~�}�~  �}    l     �|�{�|  �{    l     �z�z   %  ==============================    	 l     �y
�y  
 &   = PASTE TEXT TO THE PASTE BIN =   	  l     �x�x   %  ==============================     l     �w�v�w  �v    l ���u r  �� m  ��       o      �t�t 0 the_url  �u    l ���s Z  ���r�q > �� o  ���p�p 0 the_choices   m  ���o
�o boovfals k  ��  I  ���n �m�n 0 savechoices saveChoices  !�l! o  ���k�k 0 the_choices  �l  �m   "�j" r  ��#$# I ���i%�h
�i .sysoexecTEXT���     TEXT% m  ��&& - '"$TM_BUNDLE_SUPPORT/paste_to_pastie.rb"   �h  $ o      �g�g 0 the_url  �j  �r  �q  �s   '(' l     �f�e�f  �e  ( )*) l     �d+�d  + $  =============================   * ,-, l     �c.�c  . $  = PERFORM REQUESTED OPTIONS =   - /0/ l     �b1�b  1 $  =============================   0 232 l     �a�`�a  �`  3 454 l ��6�_6 Z  ��78�^�]7 > ��9:9 o  ���\�\ 0 the_url  : m  ��;;      8 I  ���[<�Z�[ 0 actonurl actOnURL< =>= o  ���Y�Y 0 the_url  > ?�X? o  ���W�W 0 the_choices  �X  �Z  �^  �]  �_  5 @A@ l     �V�U�V  �U  A BCB l     �T�S�T  �S  C DED i     FGF I      �RH�Q�R 0 actonurl actOnURLH IJI o      �P�P 0 the_url  J K�OK o      �N�N 0 the_choices  �O  �Q  G X    L�MML k   	NN OPO r    QRQ c    STS o    �L�L 0 each_action  T m    �K
�K 
TEXTR o      �J�J 0 each_action  P UVU l   �I�H�I  �H  V WXW l   �GY�G  Y "  send the URL to Quicksilver   X Z�FZ Z   	[\]�E[ l   ^�D^ =   _`_ o    �C�C 0 each_action  ` m    aa  Send to Quicksilver   �D  \ k    .bb cdc O    ,efe k     +gg hih I    %�B�A�@
�B .miscactvnull��� ��� null�A  �@  i j�?j r   & +klk o   & '�>�> 0 the_url  l 1   ' *�=
�= 
sele�?  f m    mm�null     ߀��  *Quicksilver.app  �]�    ��ϰ    }pH   )       ��(�\�x���� ~daed   alis    T  Ladybird                   ���BH+    *Quicksilver.app                                                 K	-����        ����  	                Applications    ���"      ����      *  %Ladybird:Applications:Quicksilver.app      Q u i c k s i l v e r . a p p    L a d y b i r d  Applications/Quicksilver.app  / ��  d non l  - -�<�;�<  �;  o p�:p l  - -�9q�9  q $  send the URL to the clipboard   �:  ] rsr =  1 4tut o   1 2�8�8 0 each_action  u m   2 3vv  Copy to Clipboard   s wxw k   7 >yy z{z I  7 <�7|�6
�7 .JonspClpnull���     ****| o   7 8�5�5 0 the_url  �6  { }~} l  = =�4�3�4  �3  ~ �2 l  = =�1��1  � * $ open the URL in the default browser   �2  x ��� =  A D��� o   A B�0�0 0 each_action  � m   B C��  Open in Browser   � ��� k   G N�� ��� I  G L�/��.
�/ .GURLGURLnull��� ��� TEXT� o   G H�-�- 0 the_url  �.  � ��� l  M M�,�+�,  �+  � ��*� l  M M�)��)  � 6 0 paste the URL to the requested IRC channel/chat   �*  � ��� C   Q T��� o   Q R�(�( 0 each_action  � m   R S��   	   � ��� k   W ��� ��� r   W `��� I   W ^�'��&�' 0 striplength  � ��� o   X Y�%�% 0 each_action  � ��$� m   Y Z�#�# �$  �&  � o      �"�" 0 each_action  � ��� O   a ���� k   e ��� ��� r   e ~��� n   e |��� 1   x |�!
�! 
trgA� n   e x��� 4   u x� �
�  
cobj� m   v w�� � l  e u��� 6  e u��� 2  e h�
� 
chvC� =  k t��� 1   l p�
� 
pnam� o   q s�� 0 each_action  �  � o      �� 0 the_channel  � ��� I   ����
� .ccoRsCmXnull���     TEXT� l   ���� b    ���� m    ���  pasted    � o   � ��� 0 the_url  �  � ���
� 
sCm1� o   � ��� 0 the_channel  � ���
� 
sCm3� m   � ��
� savoyes �  �  � m   a b �� ��� l  � ����  �  � ��� l  � ����  � * $ paste the URL to the requested chat   �  � ��� C   � ���� o   � ��� 0 each_action  � m   � ��� 	   	   � ��� k   � ��� ��� r   � ���� I   � ����
� 0 striplength  � ��� o   � ��	�	 0 each_action  � ��� m   � ��� �  �
  � o      �� 0 each_action  � ��� O  � ���� O  � ���� I  � ����
� .AdIMsndMnull���    cobj�  � ���
� 
TO  � o   � ��� 0 the_url  �  � n   � ���� 4   � �� �
�  
cobj� m   � ����� � l  � ����� 6  � ���� 2  � ���
�� 
Acht� =  � ���� 1   � ���
�� 
AchN� o   � ����� 0 each_action  ��  � m   � � N� ��� l  � �������  ��  � ���� l  � ������  � * $ paste the URL to the requested chat   ��  � ��� C   � ���� o   � ����� 0 each_action  � m   � ��� 
    	   � ���� k   ��� ��� r   � ���� I   � �������� 0 striplength  � ��� o   � ����� 0 each_action  � ���� m   � ����� ��  ��  � o      ���� 0 each_action  � ��� O  ���� I  �����
�� .ichtsendnull���    obj � o   � ����� 0 the_url  � �����
�� 
TO  � l  � ����� 4   � ����
�� 
pres� o   � ����� 0 each_action  ��  ��  � m   � � �� ���� l ������  ��  ��  ��  �E  �F  �M 0 each_action  M o    ���� 0 the_choices  E ��� l     ������  ��  �    l     ������  ��    l     ����     load default choices     i     I      ��������  0 defaultchoices defaultChoices��  ��   k     ;		 

 Q     8 k    (  r     b     l   �� I   ��
�� .earsffdralis        afdr m    ��
�� afdmpref ��
�� 
from m    ��
�� fldmfldu ����
�� 
rtyp m    ��
�� 
ctxt��  ��   m     7 1com.macromates.textmate.paste_to_server.as_record    o      ���� 0 
prefs_file    r      I   ��!��
�� .rdwropenshor       file! o    ���� 0 
prefs_file  ��    o      ���� 0 f   "#" r    "$%$ I    ��&'
�� .rdwrread****        ****& o    ���� 0 f  ' ��(��
�� 
as  ( m    ��
�� 
list��  % o      ���� 0 the_list  # )��) I  # (��*��
�� .rdwrclosnull���     ***** o   # $���� 0 f  ��  ��   R      ������
�� .ascrerr ****      � ****��  ��   k   0 8++ ,-, l  0 0��.��  . / ) either one could be the name in Colloquy   - /��/ r   0 8010 J   0 622 343 m   0 155   	#textmate   4 6��6 m   1 477   	##textmate   ��  1 o      ���� 0 the_list  ��   898 l  9 9������  ��  9 :��: L   9 ;;; o   9 :���� 0 the_list  ��   <=< l     ������  ��  = >?> l     ������  ��  ? @A@ l     ��B��  B   save choices   A CDC i    EFE I      ��G���� 0 savechoices saveChoicesG H��H o      ���� 0 the_list  ��  ��  F k     %II JKJ r     LML b     NON l    	P��P I    	��QR
�� .earsffdralis        afdrQ m     ��
�� afdmprefR ��ST
�� 
fromS m    ��
�� fldmflduT ��U��
�� 
rtypU m    ��
�� 
ctxt��  ��  O m   	 
VV 7 1com.macromates.textmate.paste_to_server.as_record   M o      ���� 0 
prefs_file  K WXW r    YZY I   ��[\
�� .rdwropenshor       file[ o    ���� 0 
prefs_file  \ ��]��
�� 
perm] m    ��
�� boovtrue��  Z o      ���� 0 f  X ^_^ I   ��`a
�� .rdwrwritnull���     ****` o    ���� 0 the_list  a ��b��
�� 
refnb o    ���� 0 f  ��  _ c��c I    %��d��
�� .rdwrclosnull���     ****d o     !���� 0 f  ��  ��  D efe l     ������  ��  f ghg l     ������  ��  h iji l     ��k��  k O I strip the first 'num' characters from 'longstring', returning the result   j l��l i    mnm I      ��o���� 0 striplength  o pqp o      ���� 0 
longstring  q r��r o      ���� 0 num  ��  ��  n L     ss c     tut l    v��v n     wxw 7  ��yz
�� 
cha y l   	{��{ [    	|}| o    ���� 0 num  } m    ���� ��  z l  
 ~��~ n   
 � 1    ��
�� 
leng� o   
 ���� 0 
longstring  ��  x o     ���� 0 
longstring  ��  u m    ��
�� 
TEXT��       ����������  � ��������~�� 0 actonurl actOnURL��  0 defaultchoices defaultChoices�� 0 savechoices saveChoices� 0 striplength  
�~ .aevtoappnull  �   � ****� �}G�|�{���z�} 0 actonurl actOnURL�| �y��y �  �x�w�x 0 the_url  �w 0 the_choices  �{  � �v�u�t�s�v 0 the_url  �u 0 the_choices  �t 0 each_action  �s 0 the_channel  � #�r�q�p�oam�n�mv�l��k��j ��i��h�g��f�e�d�c�b� N�a�`�_�^� ��]�\
�r 
kocl
�q 
cobj
�p .corecnte****       ****
�o 
TEXT
�n .miscactvnull��� ��� null
�m 
sele
�l .JonspClpnull���     ****
�k .GURLGURLnull��� ��� TEXT�j 0 striplength  
�i 
chvC�  
�h 
pnam
�g 
trgA
�f 
sCm1
�e 
sCm3
�d savoyes �c 
�b .ccoRsCmXnull���     TEXT
�a 
Acht
�` 
AchN
�_ 
TO  
�^ .AdIMsndMnull���    cobj
�] 
pres
�\ .ichtsendnull���    obj �z�[��l kh ��&E�O��  � *j O�*�,FUOPY ڢ�  �j 	OPY ʢ�  �j OPY ��� E*�ll+ E�O� 1*�-a [a ,\Z�81�k/a ,E�Oa �%a �a a a  UOPY q�a  :*�ml+ E�Oa  $*a -a [a ,\Z�81�k/ *a �l UUOPY 1�a  (*�a l+ E�Oa   �a *a !�/l "UOPY h[OY�� �[�Z�Y���X�[  0 defaultchoices defaultChoices�Z  �Y  � �W�V�U�W 0 
prefs_file  �V 0 f  �U 0 the_list  � �T�S�R�Q�P�O�N�M�L�K�J�I�H�G57
�T afdmpref
�S 
from
�R fldmfldu
�Q 
rtyp
�P 
ctxt�O 
�N .earsffdralis        afdr
�M .rdwropenshor       file
�L 
as  
�K 
list
�J .rdwrread****        ****
�I .rdwrclosnull���     ****�H  �G  �X < *������ �%E�O�j E�O���l E�O�j W X  �a lvE�O�� �FF�E�D���C�F 0 savechoices saveChoices�E �B��B �  �A�A 0 the_list  �D  � �@�?�>�@ 0 the_list  �? 0 
prefs_file  �> 0 f  � �=�<�;�:�9�8�7V�6�5�4�3�2
�= afdmpref
�< 
from
�; fldmfldu
�: 
rtyp
�9 
ctxt�8 
�7 .earsffdralis        afdr
�6 
perm
�5 .rdwropenshor       file
�4 
refn
�3 .rdwrwritnull���     ****
�2 .rdwrclosnull���     ****�C &������ �%E�O��el 	E�O��l O�j � �1n�0�/���.�1 0 striplength  �0 �-��- �  �,�+�, 0 
longstring  �+ 0 num  �/  � �*�)�* 0 
longstring  �) 0 num  � �(�'�&
�( 
cha 
�' 
leng
�& 
TEXT�. �[�\[Z�k\Z��,2�&� �%��$�#���"
�% .aevtoappnull  �   � ****� k    ���  ��  ,��  <��  k��  ���  ���  ���  ��� �� �� 4�!�!  �$  �#  � � ��  0 	each_chat  � 0 each_channel  � : &��� 4 6� C N��� Y��� e r ��� ��� � � � ������ � � � ��� �
 ��	 �� ��������&� ;��
� 
pcap
� 
pnam� 0 openapps openApps� 0 the_list  
� 
Acht
� 
AchN� 0 adium_chats  
� 
kocl
� 
cobj
� .corecnte****       ****
� 
dchM
� 
crmM� 0 colloquy_channels  
� 
pres
� 
stat
� pstaoffl
� pstaunkn� 0 ichat_accounts  �  0 defaultchoices defaultChoices� 0 default_items  
�
 
okbt
�	 
prmp
� 
appr
� 
inSL
� 
mlsl� 

� .gtqpchltns    @   @ ns  � 0 the_choices  � 0 the_url  � 0 savechoices saveChoices
�  .sysoexecTEXT���     TEXT�� 0 actonurl actOnURL�"�� 	*�-�,E�UO��lvE�O�� C� 	*�-�,E�UO�jv 
��%E�Y hO �[��l kh  �a �%kv%E�[OY��Y hO�a  da  "*a -�,a [�,\Za 91*a -�,%E` UO_ jv �a %E�Y hO !_ [��l kh �a �%kv%E�[OY��Y hO�a  la  **a -�,a [[a ,\Za 9\[a ,\Za 9A1E`  UO_  jv �a !%E�Y hO !_  [��l kh  �a "�%kv%E�[OY��Y hO�a # �a $%E�Y hO*j+ %E` &Oa ' )�a (a )a *a +a ,a -a ._ &a /ea 0 1E` 2UOa 3E` 4O_ 2f *_ 2k+ 5Oa 6j 7E` 4Y hO_ 4a 8 *_ 4_ 2l+ 9Y h ascr  ��ޭ
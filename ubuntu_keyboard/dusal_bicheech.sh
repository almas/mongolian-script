#!/bin/bash

#      Суулгах заавар:
#  Эхлээд файлдаа ажиллах эрх өгөх хэрэгтэй. Ингэхдээ:
#  Татаж авсан файл дээрээ Хулганы баруун товч дараад Properties->Permissions             
#  хэсэгт "Allow executing file as program" гэснийг чагталж                  
#  хаагаад дараа нь ажиллуулж суулгана.                                    
#  Хэрэв Run гэсэн сонголт гарч ирэхгүй бол File Manager (Nautilus)        
#  дээрээ Edit → Preferences → 'Behavior' дээр "Executable Text Files"-ыг  
#  "Ask each time"  болгож сонгоод ажиллуулах буюу эсвэл                   
#  Terminal-аас дуудаж ажиллуулж болно.                                    


#  Copyright Dusal.net
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.



zenity --question --title="Dusal Bicheech for Linux" --text="Суулгахад root хандалт шаардлагатай. Та зөвшөөрч байна уу?"
case $? in
    0)
echo "<div style=\"font-size: 10pt;\">
       <h3 align=\"center\">Дусал Бичээч хувилбар 3.1</h3>

Англи үсгийн байрлалтай Монгол Кирилл гарын драйвер + Монгол бичгийн драйвер <br /><br />

Ubuntu 8.10 - 14.04 (ба бусад зарим Linux) хувилбарт суулгах суулгагч<br /><br />

Энэ скрипт нь туршигдсан боловч ямар нэгэн баталгаа өгөхгүй!<br />
Та хүссэнээрээ өөрчлөх, хуулбарлах, хэрэглэх боломжтой.<br /><br />

Ямар нэгэн алдаа, асуудалтай зүйл байвал холбоо бариарай.<br /><br />
Монгол бичгийн драйверыг mongolfont.blogspot.de хуудаснаас авч оруулав.<br /><br />
                     <div align=\"center\">almas@dusal.net</div>
		     
		     </div>">./tmp.txt
echo '#!/bin/bash

title="Dusal Bicheech for Linux"
text_second_window="Хийх үйлдлээ сонгоно уу"


zenity --text-info --title="$title" --width=500 --height=420 --filename="./tmp.txt" --html --checkbox="Зөвшөөрч байна. Суулгая."
case $? in
    0)

options=("Суулгах" "Устгах") #"Хадгалсан системийн файлуудыг устгах")

while opt=$(zenity --width=500 --height=200 --title="$title" --text="$text_second_window" --list \
                   --column="Үйлдлүүд:" "${options[@]}"); do

    case "$opt" in
    "${options[0]}" ) 
				re_match="<iso639Id>mng<\/iso639Id>"
			replace="<iso639Id>mng<\/iso639Id>\
        <\/languageList>\
      <\/configItem>\
      <variantList>\
			<variant>\
			  <configItem>\
				<name>mongolianqwerty<\/name>\
				<description>Mongolian QWERTY<\/description>\
			  <\/configItem>\
			<\/variant>\
			<variant>\
			  <configItem>\
				<name>mongolianscript<\/name>\
				<description>Mongolian Script<\/description>\
			  <\/configItem>\
			<\/variant>\
			<variant>\
			  <configItem>\
				<name>mongolianscriptq<\/name>\
				<description>Mongolian Script Qwerty<\/description>\
			  <\/configItem>\
			<\/variant>\
	  <\/variantList>\
	<configItem>\
      <languageList>"
			re_match2="<iso639Id>mon<\/iso639Id>"
			replace2="<iso639Id>mon<\/iso639Id>\
        <\/languageList>\
      <\/configItem>\
      <variantList>\
			<variant>\
			  <configItem>\
				<name>mongolianqwerty<\/name>\
				<description>Mongolian QWERTY<\/description>\
			  <\/configItem>\
			<\/variant>\
			<variant>\
			  <configItem>\
				<name>mongolianscript<\/name>\
				<description>Mongolian Script<\/description>\
			  <\/configItem>\
			<\/variant>\
			<variant>\
			  <configItem>\
				<name>mongolianscriptq<\/name>\
				<description>Mongolian Script Qwerty<\/description>\
			  <\/configItem>\
			<\/variant>\
	  <\/variantList>\
	<configItem>\
      <languageList>"
      
				if [ -e /usr/share/X11/xkb/rules/evdev.xml.bak ]; then
					sudo rm /usr/share/X11/xkb/rules/evdev.xml
					sudo mv /usr/share/X11/xkb/rules/evdev.xml.bak /usr/share/X11/xkb/rules/evdev.xml
					if [ $? -eq 1 ]; then
					  zenity --width=500 --height=200 --warning --text="Нууц үг буруу эсвэл ямар нэгэн хандалтын алдаа гарлаа. Суулгаж чадсангүй. :-("
					  rm ./tmp.sh ./tmp.txt -f
					  exit
					fi
					if [ -e /usr/share/X11/xkb/rules/base.xml.bak ]; then
						sudo rm /usr/share/X11/xkb/rules/base.xml
						sudo mv /usr/share/X11/xkb/rules/base.xml.bak /usr/share/X11/xkb/rules/base.xml	
					fi
					if [ -e /etc/X11/xkb/base.xml.bak ]; then
						sudo rm /etc/X11/xkb/base.xml
						sudo mv /etc/X11/xkb/base.xml.bak /etc/X11/xkb/base.xml
					fi
					if [ -e /usr/share/X11/xkb/symbols/mn.bak ]; then
						sudo rm /usr/share/X11/xkb/symbols/mn
						sudo mv /usr/share/X11/xkb/symbols/mn.bak /usr/share/X11/xkb/symbols/mn
					fi
				fi
      
				if [ ! -e /usr/share/X11/xkb/rules/evdev.xml.bak ]; then
				sudo cp /usr/share/X11/xkb/rules/evdev.xml /usr/share/X11/xkb/rules/evdev.xml.bak
				if [ $? -eq 1 ]; then
				  zenity --width=500 --height=200 --warning --text="Нууц үг буруу эсвэл ямар нэгэн хандалтын алдаа гарлаа. Суулгаж чадсангүй. :-("
				  rm ./tmp.sh ./tmp.txt -f
				  exit
				fi
				sudo cat /usr/share/X11/xkb/rules/evdev.xml.bak | sed -e "s/$re_match/$replace/g">/usr/share/X11/xkb/rules/evdev.xml
				sudo cat /usr/share/X11/xkb/rules/evdev.xml.bak | sed -e "s/$re_match2/$replace2/g">/usr/share/X11/xkb/rules/evdev.xml
				fi
				if [ -e /usr/share/X11/xkb/rules/base.xml ]; then
				 if [ ! -e /usr/share/X11/xkb/rules/base.xml.bak ]; then
				sudo cp /usr/share/X11/xkb/rules/base.xml /usr/share/X11/xkb/rules/base.xml.bak
				sudo cat /usr/share/X11/xkb/rules/base.xml.bak | sed -e "s/$re_match/$replace/g">/usr/share/X11/xkb/rules/base.xml
				sudo cat /usr/share/X11/xkb/rules/base.xml.bak | sed -e "s/$re_match2/$replace2/g">/usr/share/X11/xkb/rules/base.xml
				 fi
				fi
				if [ ! -e /etc/X11/xkb/base.xml ]; then
				 if [ ! -e /etc/X11/xkb/base.xml.bak ]; then
				sudo cp /etc/X11/xkb/base.xml /etc/X11/xkb/base.xml.bak
				sudo cat /etc/X11/xkb/base.xml.bak | sed -e "s/$re_match/$replace/g">/etc/X11/xkb/base.xml
				sudo cat /etc/X11/xkb/base.xml.bak | sed -e "s/$re_match2/$replace2/g">/etc/X11/xkb/base.xml
				 fi
				fi	
			if [ ! -f /usr/share/X11/xkb/symbols/mn.bak ]; then
			sudo cp /usr/share/X11/xkb/symbols/mn /usr/share/X11/xkb/symbols/mn.bak
			sudo echo -n "

// Last edited on: 2015/05/28
// Included Mongolian qwerty keyboard
// Author \"Almas Dusal\" <almas@dusal.net>
// www.dusal.net

partial alphanumeric_keys
xkb_symbols \"mongolianqwerty\" {

  name[Group1]= \"Mongolian qwerty\";

  key <TLDE> { [ Cyrillic_shcha,   Cyrillic_SHCHA,  	grave		] };
  key <AE01> { [ 1,                exclam,        	asciitilde	] };
  key <AE02> { [ 2,                at,                  division	] };
  key <AE03> { [ 3,     	   numerosign,		plusminus	] };
  key <AE04> { [ 4, 		   U20ae,      		degree		] };
  key <AE05> { [ 5,                percent,		multiply     	] };
  key <AE06> { [ 6, 		   colon,      		semicolon	] };
  key <AE07> { [ 7,		   minus,        	ampersand    	] };
  key <AE08> { [ 8,		   asterisk,            equal	        ] };
  key <AE09> { [ 9,                parenleft,          	bracketleft     ] };
  key <AE10> { [ 0,                parenright,      	bracketright   	] };
  key <AE11> { [ Cyrillic_sha,     Cyrillic_SHA,       	underscore      ] };
  key <AE12> { [ Cyrillic_hardsign, Cyrillic_HARDSIGN, 	plus       	] };

  key <AD01> { [ Cyrillic_o_bar,    Cyrillic_O_bar,     apostrophe      ] };
  key <AD02> { [ Cyrillic_ie,       Cyrillic_IE,        grave           ] };
  key <AD03> { [ Cyrillic_e,        Cyrillic_E,        	EuroSign        ] };
  key <AD04> { [ Cyrillic_er,       Cyrillic_ER,      	registered      ] };
  key <AD05> { [ Cyrillic_te,       Cyrillic_TE,        trademark       ] };
  key <AD06> { [ Cyrillic_yu,       Cyrillic_YU,       	yen             ] };
  key <AD07> { [ Cyrillic_u,        Cyrillic_U,      	doublelowquotemark   ] };
  key <AD08> { [ Cyrillic_i,        Cyrillic_I,      	leftdoublequotemark  ] };
  key <AD09> { [ Cyrillic_o,        Cyrillic_O,		rightdoublequotemark] };
  key <AD10> { [ Cyrillic_pe,       Cyrillic_PE,      	NoSymbol        ] };
  key <AD11> { [ Cyrillic_ya,       Cyrillic_YA,      	braceleft       ] };
  key <AD12> { [ Cyrillic_io,       Cyrillic_IO, 	braceright      ] };

  key <AC01> { [ Cyrillic_a,        Cyrillic_A,   	mu              ] };
  key <AC02> { [ Cyrillic_es,       Cyrillic_ES,     	sterling        ] };
  key <AC03> { [ Cyrillic_de,       Cyrillic_DE,       	dollar          ] };
  key <AC04> { [ Cyrillic_yeru,     Cyrillic_YERU,      rightdoublequotemark ] };
  key <AC05> { [ Cyrillic_ghe,      Cyrillic_GHE,      	Cyrillic_yeru   ] };
  key <AC06> { [ Cyrillic_ha,       Cyrillic_HA,       	Cyrillic_YERU   ] };
  key <AC07> { [ Cyrillic_zhe,      Cyrillic_ZHE,       Cyrillic_e      ] };
  key <AC08> { [ Cyrillic_ka,       Cyrillic_KA,       	Cyrillic_E      ] };
  key <AC09> { [ Cyrillic_el,       Cyrillic_EL,       	numerosign      ] };
  key <AC10> { [ Cyrillic_shorti,   Cyrillic_SHORTI,    section         ] };
  key <AC11> { [ Cyrillic_softsign, Cyrillic_SOFTSIGN,  ellipsis        ] };
  key <BKSL> { [ Cyrillic_ef,       Cyrillic_EF,	bar             ] };

  key <AB01> { [ Cyrillic_ze,       Cyrillic_ZE,       	emdash          ] };
  key <AB02> { [ Cyrillic_che,      Cyrillic_CHE,      	endash          ] };
  key <AB03> { [ Cyrillic_tse,      Cyrillic_TSE,       copyright       ] };
  key <AB04> { [ Cyrillic_ve,       Cyrillic_VE,       	NoSymbol        ] };
  key <AB05> { [ Cyrillic_be,       Cyrillic_BE,       	NoSymbol        ] };
  key <AB06> { [ Cyrillic_en,       Cyrillic_EN,        less            ] };
  key <AB07> { [ Cyrillic_em,       Cyrillic_EM,       	greater         ] };
  key <AB08> { [ comma,    	    minus,  		guillemotleft   ] };
  key <AB09> { [ period, 	    question,		guillemotright  ] };
  key <AB10> { [ Cyrillic_u_straight,Cyrillic_U_straight,	slash   ] };

  // End alphanumeric section

  key <SPCE> { [ space,             space,             	nobreakspace    ] };

  include \"level3(ralt_switch)\"
};


// Last edited on: 2015/06/27
// Included Mongolian Script keyboard
// Created by mongolfont.blogspot.de 

partial default alphanumeric_keys
xkb_symbols \"mongolianscript\" {

  name[Group1]= \"Mongolian Script\";

  key <TLDE> { [ U301C,  U20AE	   ] };//~  Tilde Tugrig 
  key <AE01> { [ U0031,  U2049     ] };//1  one   !
  key <AE02> { [ U0032,  U003C     ] };//2  two   Less <
  key <AE03> { [ U0033,  U003E     ] };//3  three Greater >
  key <AE04> { [ U0034,  U0024     ] };//4  four  Dollar $
  key <AE05> { [ U0035,  U0025     ] };//5  five  persent %
  key <AE06> { [ U0036,  U002E     ] };//6  six   full stop .
  key <AE07> { [ U0037,  U002C     ] };//7  seven comma ,
  key <AE08> { [ U0038,  U002A     ] };//8  eight asterisk *
  key <AE09> { [ U0039,  U0028     ] };//9  nine  Left double parenthesis(
  key <AE10> { [ U0030,  U0029     ] };//0  zero  Right double parenthesis)
  key <AE11> { [ U002D,  U002F     ] };//-  minus slash 
  key <AE12> { [ U003D,  U002B     ] };//=  equal plus 

  key <AD01> { [ U1839,  U003A     ] };//Q  FA     :
  key <AD02> { [ U1834,  U003B     ] };//W  CHA    ;
  key <AD03> { [ U1824,  U3010     ] };//E  U     left black Lentucular bracke
  key <AD04> { [ U1835,  U3011     ] };//R  JA    Right black Lentucular bracket4Dots ::
  key <AD05> { [ U1821,  U3008     ] };//T  E     Left angle bracket
  key <AD06> { [ U1828,  U3009     ] };//Y  NA    Right angle bracket
  key <AD07> { [ U182d,  U180C     ] };//U  GA    FVS2
  key <AD08> { [ U1831,  U180D     ] };//I  SHA   FVS3
  key <AD09> { [ U1826,  U23DE     ] };//O  UE    Top Curly bracket  
  key <AD10> { [ U183d,  U23DF     ] };//P  ZA    Bottom Curly bracket 
  key <AD11> { [ U183b,  U23B4     ] };//[ KHA   Top square bracket [
  key <AD12> { [ U182B,  U23B5     ] };//   PA    Bottom square bracket ]

  key <AC01> { [ U1829,  U200D     ] };//A  NG    ZWJ
  key <AC02> { [ U180E,  U180A     ] };//S  MVS   Nirugu
  key <AC03> { [ U182a,  U1838     ] };//D  BA    WA
  key <AC04> { [ U1825,  U181B     ] };//F  OE
  key <AC05> { [ U1820,  U181E	   ] };//G  A
  key <AC06> { [ U182C,  U183E     ] };//H  QA    HAA
  key <AC07> { [ U1837,  U183F     ] };//J  RA    ZRA
  key <AC08> { [ U1823,  U183a     ] };//K  O	  KA
  key <AC09> { [ U182F,  U1840     ] };//L  LA    LHA
  key <AC10> { [ U1833,  U1804     ] };//:; DA    Mongolian Colon
  key <AC11> { [ U180B,  U1801     ] };//\" FVS1  Ellipses
  key <BKSL> { [ U1806,  U200C     ] };//|\ hyphen     ZWNJ

  key <LSGT> { [ NoSymbol,NoSymbol ] };
  key <AB01> { [ U1836,  U1841     ] };//Z  YA    ZHI
  key <AB02> { [ U183c,  U1842     ] };//X  TSA   CHI
  key <AB03> { [ U1827,  U181A     ] };//C  EE    
  key <AB04> { [ U1830,  U181C     ] };//V  SA    
  key <AB05> { [ U182e,  U181D     ] };//B  MA    
  key <AB06> { [ U1822,  U1800     ] };//N  I     Birga  
  key <AB07> { [ U1832,  U1805     ] };//M  TA    4Dots   
  key <AB08> { [ U1802,  U300A     ] };//<  COMMA Left double angle bracket
  key <AB09> { [ U1803,  U300B     ] };//>  FullS Right double angle bracket
  key <AB10> { [ U202f,  U2048     ] };//?  NNBS  Question

  // End alphanumeric section

  key <SPCE> { [     space ] };

  //include \"level2(ralt_switch)\"
};

/////////////////////////////////////////////////////////////////////////////////
//
// Generated keyboard layout file with the Keyboard Layout Editor.
// For more about the software, see http://code.google.com/p/keyboardlayouteditor
//
partial default alphanumeric_keys
xkb_symbols \"mongolianscriptq\"
{
	name[Group1] = \"Mongolian Script Qwerty\";
	key <AB01> { [          U183D,          U1841                                 ] }; // ᠽ ᡁ 
	key <AB02> { [          U1831,          U1842                                 ] }; // ᠱ ᡂ 
	key <AB03> { [          U1834,          U183C                                 ] }; // ᠴ ᠼ 
	key <AB04> { [          U1838,          U0028                                 ] }; // ᠸ ( 
	key <AB05> { [          U182A,          U0029                                 ] }; // ᠪ ) 
	key <AB06> { [          U1828,          U1800                                 ] }; // ᠨ ᠀ 
	key <AB07> { [          U182E,          U1805                                 ] }; // ᠮ ᠅ 
	key <AB08> { [          U1802,          U300A                                 ] }; // ᠂ 《 
	key <AB09> { [          U1803,          U300B                                 ] }; // ᠃ 》 
	key <AB10> { [          U202F,          U2048                                 ] }; //   ⁈ 
	key <AC01> { [          U1820,          U200D                                 ] }; // ᠠ ‍ 
	key <AC02> { [          U1830,          U180A                                 ] }; // ᠰ ᠊ 
	key <AC03> { [          U1833,          U0025                                 ] }; // ᠳ % 
	key <AC04> { [          U1829,          U180D                                 ] }; // ᠩ ᠍ 
	key <AC05> { [          U182D,          U180C                                 ] }; // ᠭ ᠌ 
	key <AC06> { [          U182C,          U183E                                 ] }; // ᠬ ᠾ 
	key <AC07> { [          U1835,          U183F                                 ] }; // ᠵ ᠿ 
	key <AC08> { [          U183B,          U183A                                 ] }; // ᠻ ᠺ 
	key <AC09> { [          U182F,          U1840                                 ] }; // ᠯ ᡀ 
	key <AC10> { [          U180E,          U1804                                 ] }; // ᠎ ᠄ 
	key <AC11> { [          U180B,          U1801                                 ] }; // ᠋ ᠁ 
	key <AD01> { [          U1825,          U200C                                 ] }; // ᠥ ‌ 
	key <AD02> { [          U1826,          U1806                                 ] }; // ᠦ ᠆ 
	key <AD03> { [          U1821,          U3010                                 ] }; // ᠡ 【 
	key <AD04> { [          U1837,          U3011                                 ] }; // ᠷ 】 
	key <AD05> { [          U1832,          U3008                                 ] }; // ᠲ 〈 
	key <AD06> { [          U1836,          U3009                                 ] }; // ᠶ 〉 
	key <AD07> { [          U1824,          U20AE                                 ] }; // ᠤ ₮ 
	key <AD08> { [          U1822,         exclam                                 ] }; // ᠢ ! 
	key <AD09> { [          U1823,          U23DE                                 ] }; // ᠣ ⏞ 
	key <AD10> { [          U182B,          U23DF                                 ] }; // ᠫ ⏟ 
	key <AD11> { [          U1827,          U23B4                                 ] }; // ᠧ ⎴ 
	key <AD12> { [          U1839,          U23B5                                 ] }; // ᠹ ⎵ 
	key <AE01> { [          U0031,          U1811                                 ] }; // 1 ᠑ 
	key <AE02> { [          U0032,          U1812                                 ] }; // 2 ᠒ 
	key <AE03> { [          U0033,          U1813                                 ] }; // 3 ᠓ 
	key <AE04> { [          U0034,          U1814                                 ] }; // 4 ᠔ 
	key <AE05> { [          U0035,          U1815                                 ] }; // 5 ᠕ 
	key <AE06> { [          U0036,          U1816                                 ] }; // 6 ᠖ 
	key <AE07> { [          U0037,          U1817                                 ] }; // 7 ᠗ 
	key <AE08> { [          U0038,          U1818                                 ] }; // 8 ᠘ 
	key <AE09> { [          U0039,          U1819                                 ] }; // 9 ᠙ 
	key <AE10> { [          U0030,          U1810                                 ] }; // 0 ᠐ 
	key <AE11> { [    KP_Subtract,      KP_Divide                                 ] }; // - / 
	key <AE12> { [       KP_Equal,         KP_Add                                 ] }; // = + 
	key <BKSL> { [          U1804,      semicolon                                 ] }; // ᠄ ; 
	key <TLDE> { [          U1809,          U1808                                 ] }; // ᠉ ᠈ 
};

">>/usr/share/X11/xkb/symbols/mn
		fi

sudo rm -rf /var/lib/xkb/*.xkm
 
echo "<div style=\"font-size: 10pt;\"><h4 align=\"center\">Суулгаж дууслаа.</h4>

<div>Та одоо компьютераа унтрааж асаана уу! Унтрааж асаахгүй бол зөв ажиллахгүй гэдгийг санаарай.</div>
<div><a href=\"http://blogmn.net\">Blogmn.net</a> рүү ороод Google-ийн сурталчилгаан дээр хааяа дарж өгч дэмжиж байгаарай ;-)</div>
<h5>Гар тохируулах заавар</h5>
Ubuntu хувилбар бүр дээр бага зэрэг өөр байдаг ч доорх заавраас санаа авна уу:<br /><br />
<ol>
<li>System -> Settings -> Keyboard -> Layouts эсвэл Settings -> Text Entry нээгээд Add эсвэл + товч дарна.</li>
<li>Country -> Mongolia сонгоод Variants -> Mongolian QWERTY эсвэл шууд хайх хэсэгт Mongolian гэж хайгаад гарч ирэхэд сонгоно.</li>
<li>Мөн third level choosers буюу гуравдагч өөр товч дараад өөр тэмдэгтүүд гаргах товчийг сонгож болно. Энэ нь гараа солилгүйгээр шорткатаар илүү олон тэмдэгтийг оруулах боломж олгодог:<br />
    Ингэхдээ System -> Settings -> Keyboard -> Shortcuts -> Typing руу ороод
    \"Alternative Characters Key\" дээр ямар нэгэн товч сонгож өгөөрэй. Ингэснээр Монголоор бичих үедээ сонгосон товчоо дараад бичихэд өөр тэмдэгтүүдийг сонгох боломжтой болно. </li>
<li>Зарим хувилбарууд дээр гарын сонголтыг үйлдлийн мөрөнд цагны хажууд гаргахын тулд хоосон хэсэгт нь баруун дараад Add to Panel дарж нээгээд Keyboard indicator сонгож оруулна.</li>
<li>Ингээд боллоо! :-)</li>

</ol><br /><br />
Ямар нэгэн асуудал гарвал <strong>almas@dusal.net</strong> хаягаар холбогдох боломжтой.
</div>">./tmp.txt

zenity --text-info --title="$title" --width=500 --height=400 --filename="./tmp.txt" --html


rm ./tmp.sh ./tmp.txt -f
	exit
	;;
    "${options[1]}" ) if [ -e /usr/share/X11/xkb/rules/evdev.xml.bak ]; then
				sudo rm /usr/share/X11/xkb/rules/evdev.xml
				sudo mv /usr/share/X11/xkb/rules/evdev.xml.bak /usr/share/X11/xkb/rules/evdev.xml
				if [ $? -eq 1 ]; then
				  zenity --width=500 --height=200 --warning --text="Нууц үг буруу эсвэл ямар нэгэн хандалтын алдаа гарлаа. Үйлдэл амжилтгүй боллоо. :-("
				  rm ./tmp.sh ./tmp.txt -f
				  exit
				fi
				if [ -e /usr/share/X11/xkb/rules/base.xml.bak ]; then
					sudo rm /usr/share/X11/xkb/rules/base.xml
					sudo mv /usr/share/X11/xkb/rules/base.xml.bak /usr/share/X11/xkb/rules/base.xml
				fi
				if [ -e /etc/X11/xkb/base.xml.bak ]; then
					sudo rm /etc/X11/xkb/base.xml
					sudo mv /etc/X11/xkb/base.xml.bak /etc/X11/xkb/base.xml
				fi
				if [ -e /usr/share/X11/xkb/symbols/mn.bak ]; then
					sudo rm /usr/share/X11/xkb/symbols/mn
					sudo mv /usr/share/X11/xkb/symbols/mn.bak /usr/share/X11/xkb/symbols/mn
				fi
				zenity --width=500 --height=200 --info --text="Хэрвээ нууц үг зөв бөгөөд ямар нэгэн алдаа гараагүй бол үйлдэл амжилттай хийгдсэн гэж бодож байна. :-)"
				rm ./tmp.sh ./tmp.txt -f
				exit
		   else
				zenity --width=500 --height=200 --warning --text="Системийн анхны файлууд олдсонгүй. Устгах боломжгүй байна. Уучлаарай."
				rm ./tmp.sh ./tmp.txt -f
				exit
		   fi
		   ;;
    "${options[2]}" ) if [ -e /usr/share/X11/xkb/rules/evdev.xml.bak ]; then
				sudo rm /usr/share/X11/xkb/rules/evdev.xml.bak
				if [ -e /usr/share/X11/xkb/rules/base.xml.bak ]; then
					sudo rm /usr/share/X11/xkb/rules/base.xml.bak 
				fi
				if [ -e /etc/X11/xkb/base.xml.bak ]; then
					sudo rm /etc/X11/xkb/base.xml.bak
				fi
				if [ -e /usr/share/X11/xkb/symbols/mn.bak ]; then
					sudo rm /usr/share/X11/xkb/symbols/mn.bak
				fi
				zenity --width=500 --height=200 --info --text="Хэрвээ нууц үг зөв бөгөөд ямар нэгэн алдаа гараагүй бол үйлдэл амжилттай хийгдсэн гэж бодож байна. :-)"
				rm ./tmp.sh ./tmp.txt -f
				exit
			else
				zenity --width=500 --height=200 --warning --text="Ямар нэгэн устгах файл олсонгүй."
				rm ./tmp.sh ./tmp.txt -f
				exit
			fi;;
    *) zenity --error --text="Invalid option. Try another one.";;
    esac

done
;;

esac

rm ./tmp.sh ./tmp.txt -f
exit'>./tmp.sh
PASSWD="$(zenity --password --title='Нууц үг ээ оруулна уу')\n"
echo -e $PASSWD | sudo -S bash ./tmp.sh
    case $? in
	 1)
	    rm ./tmp.sh ./tmp.txt -f
	    ;;
	-1)
	    rm ./tmp.sh ./tmp.txt -f
	    ;;
    esac
;;
esac

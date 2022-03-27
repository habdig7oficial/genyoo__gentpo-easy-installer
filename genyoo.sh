#!/bin/bash 

echo -e "\nCopyright 2022 Mateus Felipe da Silveira Vieira\n"

echo -e "Genyoo v.0.0.1\n"

echo -e "Este arquivo é parte do programa Genyoo
\n
Genyoo é um software livre; você pode redistribuí-lo e/ou 
modificá-lo dentro dos termos da Licença Pública Geral GNU como 
publicada pela Free Software Foundation (FSF); na versão 3 da 
Licença, ou qualquer versão posterior.
\n
Este programa é distribuído na esperança de que possa ser útil,
mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO
a qualquer MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a
Licença Pública Geral GNU para maiores detalhes.
\n
Você deve ter recebido uma cópia da Licença Pública Geral GNU junto
com este programa, Se não, veja <http://www.gnu.org/licenses/>.\n"

echo -e "\nPor favor note que esse é somente um script para tentar automarizar a instalação do gentoo linux confira o site oficial do gentoo em <https://www.gentoo.org/> e utilize este script por conta e risco"

while true; do
    read -p "Você deseja prosseguir na sua instalação de Gentoo? [S/n]:" sn
    case $sn in
        [Ss]* ) clear; echo -e "\nok vamos la :)\n"; 

        while true; do
        read -p "Você está utilizando a iso oficial do Gentoo? [S/n]:" sn
        case $sn in
            [Ss]* ) ISGENTOO=true; break;;
            [Nn]* ) ISGENTOO=false; break;;
            * ) echo "Por favor responda [S/s] sim ou [N/n] não";;
        esac
    done;


    ifconfig -a;

        while true; do
        read -p "Qual é a sua interface desejada: " Interede
        case $Interede in
            * )        
        while true; do
        read -p "Essa Interface ($Interede) está correta [S/n]:"  sn
        case $sn in
            [Ss]* ) 
                    echo -e "\nconfiguração de proxy ainda não disponivel\n";

                    if [ $ISGENTOO == true ]; then
                        net-setup $Interede;
                    else
                        echo "opa está parte ainda não está finalizada seguindo adiante"
                    fi

                    echo -e "\nchecando conexao\n";
                    

                    ping -c 5 www.gentoo.org;

                while true; do
                read -p "Particionamento Automático? [S/n]:" sn
                case $sn in
                    [Ss]* ) echo "opa está parte ainda não está finalizada seguindo adiante";;
                    [Nn]* )  while true; do
                            read -p "Nome do Disco?:" disk
                            case $disk in
                                * ) while true; do
                                        read -p "O Nome está correto ($disk) [S/n]:" sn
                                        case $sn in
                                            [Ss]* ) cfdisk /dev/$disk;;
                                            [Nn]* ) ISGENTOO=false; break;;
                                            * ) echo "Por favor responda [S/s] sim ou [N/n] não";;
                                        esac

                                done;;
                            esac
                        done;;
                    * ) echo "Por favor responda [S/s] sim ou [N/n] não";;
                esac
            done;

                exit;;

                    
            [Nn]* )   break;;
            * ) echo "Por favor responda [S/s] sim ou [N/n] não";;
        esac
    done
        esac
    done;;



        [Nn]* ) echo "ok obrigado tchau :/"; exit;;
        * ) echo "Por favor responda [S/s] sim ou [N/n] não";;
    esac
done;


#wget "https://bouncer.gentoo.org/fetch/root/all/releases/amd64/autobuilds/20220320T170531Z/stage3-amd64-openrc-20220320T170531Z.tar.xz"


@echo off
:SelectFile
echo ��������Ҫ�����ϣֵ���ļ��������س�
:InvalidFilePath
set "filePath="
set /p "filePath="
if "%filePath%"=="" (
    echo û���ļ�·�������������������
    goto InvalidFilePath
)
if not exist "%filePath%" (
    echo �ļ�·�������ڣ����������������
    goto InvalidFilePath
)
:SelectType
echo ѡ���ϣ�㷨��
echo 1. MD2
echo 2. MD4
echo 3. MD5
echo 4. SHA1
echo 5. SHA256
echo 6. SHA384
echo 7. SHA512
echo 8. ��ѡ�ļ�
set "hashType="
set /p "hashType="
if "%hashType%"=="" (
    goto SelectType
)
if "%hashType%"=="1" (
    echo ��ʼ�����ļ�MD2
    certutil -hashfile "%filePath%" MD2
    echo;
) else (
    if "%hashType%"=="2" (
        echo ��ʼ�����ļ�MD4
        certutil -hashfile "%filePath%" MD4
        echo;
    ) else (
        if "%hashType%"=="3" (
            echo ��ʼ�����ļ�MD5
            certutil -hashfile "%filePath%" MD5
            echo;
        ) else (
            if "%hashType%"=="4" (
                echo ��ʼ�����ļ�SHA1
                certutil -hashfile "%filePath%" SHA1
                echo;
            ) else (
                if "%hashType%"=="5" (
                    echo ��ʼ�����ļ�SHA256
                    certutil -hashfile "%filePath%" SHA256
                    echo;
                ) else (
                    if "%hashType%"=="6" (
                        echo ��ʼ�����ļ�SHA384
                        certutil -hashfile "%filePath%" SHA384
                        echo;
                    ) else (
                        if "%hashType%"=="7" (
                            echo ��ʼ�����ļ�SHA512
                            certutil -hashfile "%filePath%" SHA512
                            echo;
                        ) else (
                            if "%hashType%"=="8" (
                                goto SelectFile
                            ) else (
                                echo ѡ����������ѡ��
                                goto SelectType
                            )
                        )
                    )
                )
            )
        )
    )
)
:SelectFileOtherType
echo �Ƿ������ļ���������ϣֵ�� 1.ȷ�� 2.ȡ��
set "isSelectOtherType="
set /p "isSelectOtherType="
if "%isSelectOtherType%"=="" (
    goto SelectFileOtherType
)
if "%isSelectOtherType%"=="1" (
    goto SelectType
) else (
    if "%isSelectOtherType%"=="2" (
        goto EndSelectOtherType
    ) else (
        echo ѡ����������ѡ��
        goto SelectFileOtherType
    )
)
:EndSelectOtherType
echo ----------------------------------------------------------------
:SelectOthersFile
echo �Ƿ���������ļ��Ĺ�ϣֵ�� 1.ȷ�� 2.ȡ��
set "isSelectOtherFile="
set /p "isSelectOtherFile="
if "%isSelectOtherFile%"=="" (
    goto SelectOthersFile
)
if "%isSelectOtherFile%"=="1" (
    goto SelectFile
) else (
    if "%isSelectOtherFile%"=="2" (
        goto EndSelectOtherFile
    ) else (
        echo ѡ����������ѡ��
        goto SelectOthersFile
    )
)
:EndSelectOtherFile
:cleanup
set "filePath="
set "hashType="
set "isSelectOtherType="
set "isSelectOtherFile="
echo END
pause
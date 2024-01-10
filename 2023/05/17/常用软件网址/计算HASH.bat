@echo off
:SelectFile
echo 请拖入需要计算哈希值的文件，并按回车
:InvalidFilePath
set "filePath="
set /p "filePath="
if "%filePath%"=="" (
    echo 没有文件路径，请重新拖入或输入
    goto InvalidFilePath
)
if not exist "%filePath%" (
    echo 文件路径不存在，请重新拖入或输入
    goto InvalidFilePath
)
:SelectType
echo 选择哈希算法：
echo 1. MD2
echo 2. MD4
echo 3. MD5
echo 4. SHA1
echo 5. SHA256
echo 6. SHA384
echo 7. SHA512
echo 8. 重选文件
set "hashType="
set /p "hashType="
if "%hashType%"=="" (
    goto SelectType
)
if "%hashType%"=="1" (
    echo 开始计算文件MD2
    certutil -hashfile "%filePath%" MD2
    echo;
) else (
    if "%hashType%"=="2" (
        echo 开始计算文件MD4
        certutil -hashfile "%filePath%" MD4
        echo;
    ) else (
        if "%hashType%"=="3" (
            echo 开始计算文件MD5
            certutil -hashfile "%filePath%" MD5
            echo;
        ) else (
            if "%hashType%"=="4" (
                echo 开始计算文件SHA1
                certutil -hashfile "%filePath%" SHA1
                echo;
            ) else (
                if "%hashType%"=="5" (
                    echo 开始计算文件SHA256
                    certutil -hashfile "%filePath%" SHA256
                    echo;
                ) else (
                    if "%hashType%"=="6" (
                        echo 开始计算文件SHA384
                        certutil -hashfile "%filePath%" SHA384
                        echo;
                    ) else (
                        if "%hashType%"=="7" (
                            echo 开始计算文件SHA512
                            certutil -hashfile "%filePath%" SHA512
                            echo;
                        ) else (
                            if "%hashType%"=="8" (
                                goto SelectFile
                            ) else (
                                echo 选择有误，重新选择
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
echo 是否计算该文件的其他哈希值？ 1.确认 2.取消
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
        echo 选择有误，重新选择
        goto SelectFileOtherType
    )
)
:EndSelectOtherType
echo ----------------------------------------------------------------
:SelectOthersFile
echo 是否计算其他文件的哈希值？ 1.确认 2.取消
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
        echo 选择有误，重新选择
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
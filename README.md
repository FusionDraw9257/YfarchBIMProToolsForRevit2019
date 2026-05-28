# Yfarch BIM Pro Tools 2019

Yfarch BIM Pro Tools 2019 是一套專為 Autodesk Revit 2019 製作的 BIM 輔助工具集，目標是減少重複建模、整理、編號、接合與匯出工作，讓建築與結構模型製作流程更快、更一致。

This repository provides public product information and release downloads. Source code, private keys, and internal build tools are not included here.

本公開倉庫只提供產品介紹、安裝說明與安裝檔下載。原始碼、授權私鑰與內部打包工具不會放在此倉庫。

## 下載 Download

請到 GitHub Releases 頁面下載最新版安裝檔：

Download the latest installer from the GitHub Releases page:

https://github.com/FusionDraw9257/YfarchBIMProTools2019/releases

目前建議下載檔案：

Recommended release package:

```text
YfarchBIMProTools2019_20260527V1.rar
```

## 支援環境 Supported Environment

- Autodesk Revit 2019
- Windows
- .NET Framework 4.7.2 或相容環境

## 安裝方式 Installation

1. 關閉 Autodesk Revit 2019。
2. 到 Releases 頁面下載最新版安裝包。
3. 如下載的是 `.rar` 檔，請先解壓縮。
4. 執行安裝程式。
5. 重新開啟 Autodesk Revit 2019。
6. 在 Revit 功能列中使用 Yfarch BIM 工具。

English:

1. Close Autodesk Revit 2019.
2. Download the latest release package from the Releases page.
3. Extract the `.rar` file if needed.
4. Run the setup executable.
5. Open Autodesk Revit 2019 again.
6. Use the Yfarch BIM tools from the Revit ribbon.

## 功能介紹 Features

### 自動軸網 Auto Grids

協助使用者快速建立或整理 Revit 軸網，減少手動建立軸線與檢查軸號的時間。適合在專案初期建立結構或建築定位基準時使用。

Helps users create or organize Revit grids more efficiently, reducing repetitive manual grid setup and checking work.

### 自動結構柱 Auto Structural Columns

依據圖面或模型條件輔助產生結構柱，降低逐一放置柱構件的工作量。適合需要從 CAD/模型資訊轉換成 Revit 結構柱的流程。

Assists with generating structural columns based on drawing or model conditions, reducing the effort of placing column elements one by one.

### 自動結構梁 Auto Structural Beams

協助產生結構梁，並支援梁與柱之間的距離、位置或端點關係檢查。適合結構建模、初步建置與模型整理階段。

Assists with generating structural beams and checking beam-column relationships such as distance, placement, and endpoint conditions.

### 自動結構板 Auto Structural Slabs

輔助建立結構樓板，減少手動描繪樓板邊界與重複設定構件的時間。適合樓層平面建模與結構板配置作業。

Helps create structural slabs and reduces repetitive work when defining slab boundaries and related element settings.

### 自動牆接合 Auto Wall Join

協助處理牆體幾何接合，減少模型中牆交接位置的手動整理時間。適合牆量較多、平面需要大量清理的專案。

Helps process wall geometry joins, reducing manual cleanup around wall intersections in Revit models.

### 自動樓板邊界接合 Auto Floor Boundary Join

針對樓板或樓層邊界附近的幾何關係進行輔助接合與整理，提升模型邊界處理效率。

Assists with joining and organizing geometry around floor or level boundaries to improve model cleanup efficiency.

### 柱梁接合切換 Column And Beam Join Switch

提供柱、梁接合狀態切換與整理輔助，讓使用者更快處理構件交接時的顯示與幾何關係。

Provides helper commands for switching and organizing column-beam join states, making it easier to manage element intersections.

### 車位自動編號 Parking Space Numbering

協助停車位快速編號，減少人工逐一輸入編號造成的時間成本與錯誤。適合地下室、停車場與大量車位平面整理。

Helps number parking spaces quickly, reducing manual input time and numbering mistakes in parking plans.

### Revit 匯出 SketchUp 輔助 Revit To SketchUp Export Helper

提供 Revit 模型匯出到 SketchUp 相關流程的輔助工具，讓模型交換與後續視覺化作業更順暢。

Provides helper commands for Revit-to-SketchUp export workflows, supporting smoother model exchange and visualization preparation.

### 授權資訊 License Information

提供授權狀態查看功能，方便使用者確認目前授權或試用狀態。

Provides a license information command so users can check current activation or trial status.

## 適用對象 Who This Is For

本工具適合：

- 使用 Autodesk Revit 2019 的建築、結構與 BIM 工作流程
- 需要處理大量重複建模工作的使用者
- 需要快速整理模型接合、編號或匯出流程的 BIM 團隊
- 想降低手動操作錯誤並提高建模一致性的專案

This toolset is designed for:

- Architecture, structure, and BIM workflows using Autodesk Revit 2019
- Users who need to reduce repetitive modeling tasks
- BIM teams that need faster model cleanup, numbering, joining, and export workflows
- Projects that require better modeling consistency and fewer manual mistakes

## 授權與啟用 License And Activation

本軟體可能需要有效的試用或授權啟用。請依照安裝後顯示的授權資訊使用。

This software may require a valid trial or license activation. Please follow the activation information shown after installation.

## 更新方式 Updates

新版會發布在 GitHub Releases 頁面。更新時請下載最新版安裝包，關閉 Revit 後再執行安裝。

New versions will be published on the GitHub Releases page. To update, download the latest release package, close Revit, and run the installer.

## 問題回報 Support

如果遇到問題，可以在本倉庫開 GitHub Issue，建議提供：

- Revit 版本
- Windows 版本
- 使用的工具名稱
- 操作步驟
- 錯誤訊息或截圖

If you find a problem, please open a GitHub Issue and include:

- Revit version
- Windows version
- Tool name
- Steps to reproduce
- Error message or screenshot


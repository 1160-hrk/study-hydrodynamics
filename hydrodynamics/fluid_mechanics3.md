# 流体力学 3

## 目次

1. [乱流理論の基礎](#1-乱流理論の基礎)
   - 1.1 [乱流の特徴](#11-乱流の特徴)
   - 1.2 [レイノルズ平均](#12-レイノルズ平均)
   - 1.3 [乱流モデル](#13-乱流モデル)
   - 1.4 [壁法則](#14-壁法則)
2. [圧縮性流体力学](#2-圧縮性流体力学)
   - 2.1 [基礎方程式](#21-基礎方程式)
   - 2.2 [音速と特性速度](#22-音速と特性速度)
   - 2.3 [一次元定常流](#23-一次元定常流)
   - 2.4 [衝撃波理論](#24-衝撃波理論)
3. [数値流体力学入門](#3-数値流体力学入門)
   - 3.1 [離散化手法](#31-離散化手法)
   - 3.2 [差分法](#32-差分法)
   - 3.3 [有限要素法](#33-有限要素法)
   - 3.4 [安定性と精度](#34-安定性と精度)
4. [特殊な流れ現象](#4-特殊な流れ現象)
   - 4.1 [キャビテーション](#41-キャビテーション)
   - 4.2 [多相流](#42-多相流)
   - 4.3 [非ニュートン流体](#43-非ニュートン流体)
5. [工学応用](#5-工学応用)
   - 5.1 [流体機械](#51-流体機械)
   - 5.2 [伝熱流動](#52-伝熱流動)
   - 5.3 [環境流体](#53-環境流体)

---

## 1. 乱流理論の基礎

### 1.1 乱流の特徴

**乱流**（turbulence）は高レイノルズ数における複雑で不規則な流れ現象です。

#### 乱流の基本特性

1. **不規則性**：時間・空間的に不規則な変動
2. **非線形性**：ナビエ・ストークス方程式の非線形項が支配的
3. **散逸性**：運動エネルギーが熱に変換される
4. **混合促進**：運動量、熱、物質の輸送が促進される
5. **3次元性**：本質的に3次元現象

#### 乱流への遷移

**臨界レイノルズ数**：
- 円管内流れ：$Re_c \approx 2300$
- 平板境界層：$Re_c \approx 5 \times 10^5$

### 1.2 レイノルズ平均

**レイノルズ分解**：
瞬時値を平均値と変動値に分解：

$$u_i = \overline{u_i} + u_i', \quad p = \overline{p} + p'$$

ここで：
- $\overline{u_i}$：時間平均速度
- $u_i'$：速度変動成分

### レイノルズ平均ナビエ・ストークス方程式（RANS）

$$\frac{D\overline{u_i}}{Dt} = -\frac{1}{\rho}\frac{\partial \overline{p}}{\partial x_i} + \nu \frac{\partial^2 \overline{u_i}}{\partial x_j \partial x_j} - \frac{\partial}{\partial x_j}\overline{u_i' u_j'}$$

**レイノルズ応力**：
$$\tau_{ij}^{turb} = -\rho \overline{u_i' u_j'}$$

### クロージャー問題

RANS方程式では未知数がレイノルズ応力により方程式数より多くなる。
→ **乱流モデル**が必要

### 1.3 乱流モデル

#### k-ε モデル

**乱流運動エネルギー**：
$$k = \frac{1}{2}\overline{u_i' u_i'}$$

**乱流エネルギー散逸率**：
$$\varepsilon = \nu \overline{\frac{\partial u_i'}{\partial x_j}\frac{\partial u_i'}{\partial x_j}}$$

**輸送方程式**：
$$\frac{Dk}{Dt} = P_k - \varepsilon + \frac{\partial}{\partial x_j}\left[\left(\nu + \frac{\nu_t}{\sigma_k}\right)\frac{\partial k}{\partial x_j}\right]$$

$$\frac{D\varepsilon}{Dt} = C_{\varepsilon 1}\frac{\varepsilon}{k}P_k - C_{\varepsilon 2}\frac{\varepsilon^2}{k} + \frac{\partial}{\partial x_j}\left[\left(\nu + \frac{\nu_t}{\sigma_\varepsilon}\right)\frac{\partial \varepsilon}{\partial x_j}\right]$$

**乱流粘性**：
$$\nu_t = C_\mu \frac{k^2}{\varepsilon}$$

**モデル定数**：
$C_\mu = 0.09$, $C_{\varepsilon 1} = 1.44$, $C_{\varepsilon 2} = 1.92$, $\sigma_k = 1.0$, $\sigma_\varepsilon = 1.3$

### 1.4 壁法則

**粘性底層**（$y^+ < 5$）：
$$u^+ = y^+$$

**対数則領域**（$30 < y^+ < 300$）：
$$u^+ = \frac{1}{\kappa}\ln y^+ + B$$

ここで：
- $u^+ = \frac{u}{u_\tau}$：無次元速度
- $y^+ = \frac{y u_\tau}{\nu}$：無次元距離
- $u_\tau = \sqrt{\frac{\tau_w}{\rho}}$：摩擦速度
- $\kappa = 0.41$：カルマン定数
- $B = 5.0$：積分定数

---

## 2. 圧縮性流体力学

### 2.1 基礎方程式

#### 連続方程式
$$\frac{\partial \rho}{\partial t} + \frac{\partial}{\partial x_i}(\rho u_i) = 0$$

#### 運動量方程式
$$\frac{\partial}{\partial t}(\rho u_i) + \frac{\partial}{\partial x_j}(\rho u_i u_j) = -\frac{\partial p}{\partial x_i} + \frac{\partial \tau_{ij}}{\partial x_j}$$

#### エネルギー方程式
$$\frac{\partial}{\partial t}(\rho E) + \frac{\partial}{\partial x_i}[(\rho E + p)u_i] = \frac{\partial}{\partial x_i}\left(k\frac{\partial T}{\partial x_i}\right) + \frac{\partial}{\partial x_i}(\tau_{ij}u_j)$$

#### 状態方程式
理想気体：
$$p = \rho R T = \rho \frac{R_u}{M} T$$

### 2.2 音速と特性速度

**音速**の定義：
$$a = \sqrt{\frac{\partial p}{\partial \rho}\bigg|_s} = \sqrt{\gamma R T}$$

**マッハ数**：
$$M = \frac{u}{a}$$

流れの分類：
- $M < 1$：亜音速流れ
- $M = 1$：音速流れ  
- $M > 1$：超音速流れ

### 2.3 一次元定常流

#### 等エントロピー流れ

**面積-速度関係**：
$$\frac{dA}{A} = \frac{du}{u}(M^2 - 1)$$

- 亜音速（$M < 1$）：縮小部で加速、拡大部で減速
- 超音速（$M > 1$）：拡大部で加速、縮小部で減速

#### ラバルノズル

**チョーク条件**：
最小断面（スロート）で $M = 1$

**臨界圧力比**：
$$\frac{p^*}{p_0} = \left(\frac{2}{\gamma + 1}\right)^{\frac{\gamma}{\gamma - 1}}$$

### 2.4 衝撃波理論

#### 垂直衝撃波

**ランキン・ユゴニオ関係**：

質量保存：
$$\rho_1 u_1 = \rho_2 u_2$$

運動量保存：
$$p_1 + \rho_1 u_1^2 = p_2 + \rho_2 u_2^2$$

エネルギー保存：
$$h_1 + \frac{u_1^2}{2} = h_2 + \frac{u_2^2}{2}$$

#### 衝撃波関係式

$$\frac{p_2}{p_1} = \frac{2\gamma M_1^2 - (\gamma - 1)}{\gamma + 1}$$

$$\frac{\rho_2}{\rho_1} = \frac{(\gamma + 1)M_1^2}{(\gamma - 1)M_1^2 + 2}$$

$$M_2^2 = \frac{M_1^2 + \frac{2}{\gamma - 1}}{2\frac{\gamma}{\gamma - 1}M_1^2 - 1}$$

---

## 3. 数値流体力学入門

### 3.1 離散化手法

#### 主要な離散化手法

1. **有限差分法**（Finite Difference Method, FDM）
2. **有限要素法**（Finite Element Method, FEM）
3. **有限体積法**（Finite Volume Method, FVM）
4. **境界要素法**（Boundary Element Method, BEM）

### 3.2 差分法

#### テイラー展開に基づく差分式

$$\frac{\partial u}{\partial x}\bigg|_i \approx \frac{u_{i+1} - u_{i-1}}{2\Delta x}$$ （中心差分）

$$\frac{\partial u}{\partial x}\bigg|_i \approx \frac{u_{i+1} - u_i}{\Delta x}$$ （前進差分）

$$\frac{\partial u}{\partial x}\bigg|_i \approx \frac{u_i - u_{i-1}}{\Delta x}$$ （後退差分）

#### 2階微分

$$\frac{\partial^2 u}{\partial x^2}\bigg|_i \approx \frac{u_{i+1} - 2u_i + u_{i-1}}{(\Delta x)^2}$$

### ナビエ・ストークス方程式の離散化例

**2次元非圧縮流れ**：

$$\frac{u_{i,j}^{n+1} - u_{i,j}^n}{\Delta t} + u_{i,j}^n \frac{u_{i+1,j}^n - u_{i-1,j}^n}{2\Delta x} + v_{i,j}^n \frac{u_{i,j+1}^n - u_{i,j-1}^n}{2\Delta y} = -\frac{1}{\rho}\frac{p_{i+1,j}^n - p_{i-1,j}^n}{2\Delta x} + \nu \nabla^2 u_{i,j}^n$$

### 3.3 有限要素法

#### 弱形式の定式化

強形式：
$$-\nabla^2 u = f \quad \text{in } \Omega$$
$$u = g \quad \text{on } \partial \Omega$$

弱形式：
$$\int_\Omega \nabla v \cdot \nabla u \, d\Omega = \int_\Omega v f \, d\Omega$$

#### 形状関数

線形要素：
$$N_1 = 1 - \xi, \quad N_2 = \xi$$

2次要素：
$$N_1 = \frac{1}{2}\xi(\xi - 1), \quad N_2 = 1 - \xi^2, \quad N_3 = \frac{1}{2}\xi(\xi + 1)$$

### 3.4 安定性と精度

#### CFL条件

**Courant-Friedrichs-Lewy条件**：
$$C = \frac{u \Delta t}{\Delta x} \leq C_{max}$$

陽解法では通常 $C_{max} = 1$

#### 数値粘性と分散

**Lax-Wendroff法**：
$$u_i^{n+1} = u_i^n - \frac{C}{2}(u_{i+1}^n - u_{i-1}^n) + \frac{C^2}{2}(u_{i+1}^n - 2u_i^n + u_{i-1}^n)$$

**TVD（Total Variation Diminishing）スキーム**：
単調性を保持する高次精度スキーム

---

## 4. 特殊な流れ現象

### 4.1 キャビテーション

**キャビテーション**：液体中で局所的に圧力が蒸気圧以下になると気泡が発生する現象

#### キャビテーション数

$$\sigma = \frac{p_\infty - p_v}{\frac{1}{2}\rho u^2}$$

ここで：
- $p_\infty$：基準圧力
- $p_v$：蒸気圧
- $u$：基準速度

#### レイリー・プレセット方程式

球形気泡の力学：
$$R\frac{d^2R}{dt^2} + \frac{3}{2}\left(\frac{dR}{dt}\right)^2 = \frac{p_g - p_\infty}{\rho}$$

### 4.2 多相流

#### 流動様式

**気液二相流**の流動パターン：
1. 泡流（Bubbly flow）
2. スラグ流（Slug flow）
3. 環状流（Annular flow）
4. 分散流（Dispersed flow）

#### 基礎方程式

**混合物モデル**：
$$\frac{\partial}{\partial t}(\rho_m) + \nabla \cdot (\rho_m \mathbf{u}_m) = 0$$

$$\frac{\partial}{\partial t}(\rho_m \mathbf{u}_m) + \nabla \cdot (\rho_m \mathbf{u}_m \mathbf{u}_m) = -\nabla p + \nabla \cdot \boldsymbol{\tau}_m + \rho_m \mathbf{g}$$

### 4.3 非ニュートン流体

#### 流体の分類

**粘性の剪断速度依存性**：

1. **ニュートン流体**：$\tau = \mu \dot{\gamma}$
2. **剪断粘稠流体**：$\mu_{eff} = K(\dot{\gamma})^{n-1}$ ($n > 1$)
3. **剪断稀化流体**：$\mu_{eff} = K(\dot{\gamma})^{n-1}$ ($n < 1$)

#### べき乗則流体

$$\tau = K(\dot{\gamma})^n$$

ここで：
- $K$：稠度係数
- $n$：流動指数

---

## 5. 工学応用

### 5.1 流体機械

#### ポンプの基本理論

**オイラーポンプ方程式**：
$$H = \frac{1}{g}(u_2 c_{u2} - u_1 c_{u1})$$

ここで：
- $H$：理論揚程
- $u$：羽根車周速度
- $c_u$：絶対速度の周方向成分

#### 相似則

$$\frac{Q_1}{Q_2} = \left(\frac{N_1}{N_2}\right)\left(\frac{D_1}{D_2}\right)^3$$

$$\frac{H_1}{H_2} = \left(\frac{N_1}{N_2}\right)^2\left(\frac{D_1}{D_2}\right)^2$$

$$\frac{P_1}{P_2} = \left(\frac{N_1}{N_2}\right)^3\left(\frac{D_1}{D_2}\right)^5$$

### 5.2 伝熱流動

#### 無次元数

**レイノルズ数**：
$$Re = \frac{\rho u L}{\mu}$$

**プラントル数**：
$$Pr = \frac{c_p \mu}{k} = \frac{\nu}{\alpha}$$

**ヌセルト数**：
$$Nu = \frac{h L}{k}$$

#### 強制対流伝熱

**円管内層流**：
$$Nu = 3.66$$ （一定熱流束）
$$Nu = 4.36$$ （一定壁温）

**円管内乱流**：
$$Nu = 0.023 Re^{0.8} Pr^{0.4}$$ （Dittus-Boelter式）

### 5.3 環境流体

#### 大気境界層

**風速の鉛直分布**：

**対数則**：
$$\frac{u}{u_\tau} = \frac{1}{\kappa}\ln\frac{z}{z_0}$$

**べき乗則**：
$$\frac{u(z)}{u(z_{ref})} = \left(\frac{z}{z_{ref}}\right)^\alpha$$

#### 海洋流

**地衡流**：
コリオリ力と圧力勾配力の平衡

$$f u = -\frac{1}{\rho}\frac{\partial p}{\partial y}$$
$$f v = \frac{1}{\rho}\frac{\partial p}{\partial x}$$

ここで $f = 2\Omega \sin\phi$ はコリオリパラメータ

---

## まとめ

### 発展的概念

1. **乱流理論**：RANS、k-εモデル、壁法則
2. **圧縮性流れ**：マッハ数、衝撃波、ラバルノズル
3. **数値流体力学**：離散化、安定性、精度
4. **特殊流れ現象**：キャビテーション、多相流、非ニュートン流体

### 実用的応用

- **流体機械設計**：ポンプ、タービン、圧縮機
- **伝熱工学**：熱交換器、冷却システム
- **環境工学**：大気・海洋流動、汚染拡散

### 現代的課題

- **計算流体力学（CFD）**の発展
- **機械学習**との融合
- **マルチスケール解析**
- **環境・エネルギー問題**への応用

### 更なる発展

流体力学は航空宇宙、自動車、化学工学、気象学、海洋学など広範囲の分野で基礎となる学問であり、現在も活発に研究が進められています。特に、高性能計算技術の発展により、これまで解析困難だった複雑な流れ現象の解明や、新しい流体制御技術の開発が期待されています。 
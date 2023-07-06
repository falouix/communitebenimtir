-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : jeu. 06 juil. 2023 à 14:17
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `communebenimtir_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnes`
--

CREATE TABLE `abonnes` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `abonnes`
--

INSERT INTO `abonnes` (`id`, `email`, `created_at`, `updated_at`, `status`) VALUES
(1, 'walidhamda91@gmail.com', '2020-07-06 10:15:30', '2020-07-06 10:15:30', 'ACTIF'),
(2, 'admin@admin.com', '2020-07-06 11:03:00', '2020-07-09 08:59:23', 'ACTIF'),
(3, 'cdfdhajali@gmail.com', '2020-08-12 11:17:53', '2020-08-12 11:17:53', 'ACTIF'),
(4, 'clare_wunsch@jephy-webmail.com', '2022-07-29 01:08:02', '2022-07-29 01:08:02', 'ACTIF'),
(5, 'emilyweimann92@outlook.com', '2022-07-29 01:08:18', '2022-07-29 01:08:18', 'ACTIF'),
(7, 'velva_blanda@jephy-webmail.com', '2022-07-29 01:10:25', '2022-07-29 01:10:25', 'ACTIF'),
(8, 'sstokes81@yahoo.com', '2022-07-29 01:10:50', '2022-07-29 01:10:50', 'ACTIF'),
(10, 'trace_eichmann@jephy-webmail.com', '2022-07-29 01:13:08', '2022-07-29 01:13:08', 'ACTIF');

-- --------------------------------------------------------

--
-- Structure de la table `accueil_composants`
--

CREATE TABLE `accueil_composants` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `titre_fr` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `lien_view` varchar(255) DEFAULT NULL,
  `contenu_specifique_fr` longtext DEFAULT NULL,
  `status` varchar(255) DEFAULT 'PUBLISHED',
  `titre_en` varchar(255) DEFAULT NULL,
  `titre_ar` varchar(255) DEFAULT NULL,
  `contenu_specifique_en` longtext DEFAULT NULL,
  `contenu_specifique_ar` longtext DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `raccourci_rapideId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `accueil_composants`
--

INSERT INTO `accueil_composants` (`id`, `created_at`, `updated_at`, `titre_fr`, `position`, `lien_view`, `contenu_specifique_fr`, `status`, `titre_en`, `titre_ar`, `contenu_specifique_en`, `contenu_specifique_ar`, `type`, `raccourci_rapideId`) VALUES
(1, '2020-05-11 09:51:43', '2020-05-20 16:15:32', 'مصحف الجمهورية', 'position-motif4', 'Lien1', '<p>wdfgsd</p>', 'PUBLISHED', 'test en', 'مصحف الجمهورية', NULL, '', 3, 2),
(2, '2020-05-11 09:51:43', '2020-05-20 16:15:54', 'إحصائيات', 'position-motif2', 'Lien1', NULL, 'PUBLISHED', 'test en', 'إحصائيات', NULL, NULL, 3, 4),
(3, '2020-05-11 09:51:43', '2020-05-20 16:14:54', 'صندوق المعالم', 'position-motif3', 'Lien1', NULL, 'PUBLISHED', 'test en', 'صندوق المعالم', NULL, NULL, 3, 3),
(4, '2020-05-11 09:51:43', '2020-06-08 12:38:33', 'مساجد تونسية', 'position-motif1', 'Lien1', '<p><strong>dhsrthrthrth</strong></p>', 'PUBLISHED', 'test en', 'مصحف الجمهورية', NULL, '<p>سيفقعقفغهق</p>', 3, 5),
(5, '2020-05-11 09:51:43', '2020-05-20 16:36:20', 'الأخبار و البلاغات', 'position-actualites', 'actualites', NULL, 'PUBLISHED', 'test en', 'الأخبار و البلاغات', NULL, NULL, 1, 2),
(6, '2020-05-11 09:51:43', '2020-05-20 16:36:09', 'ندوات وملتقيات', 'position-events', 'events', '<p>a</p>', 'PUBLISHED', 'test en', 'ندوات وملتقيات', NULL, NULL, 1, 2),
(7, '2020-05-13 10:54:58', '2020-08-06 07:41:59', 'أوقات الصلاة', 'position-prayer', 'Lien4', NULL, 'PUBLISHED', NULL, 'أوقات الصلاة', NULL, NULL, 1, NULL),
(8, '2020-05-13 10:54:58', '2020-05-15 13:10:43', 'الترشح لاداء مناسك الحج', 'position-hajj', 'htmlContent', NULL, 'PUBLISHED', NULL, 'الترشح لأداء مناسك الحج', NULL, '     <h4>تسجيل التّرشّح لأداء مناسك الحجّ لموسم 1441 هـ 2020 م</h4>\r\n                                    <div class=\"voting-btns mt20\">\r\n                                        <a href=\"https://hajj.affaires-religieuses.tn/hajj\" class=\"sm-green-btn disp-block mt10\" target=\"_blank\">تسجيل الترشح</a>\r\n                                        <a href=\"https://hajj.affaires-religieuses.tn/PDF/\" class=\"sm-tellow-btn disp-block mt10\" stye=\"padding-bottom : 10px;\" target=\"_blank\">استخراج وصل ترشح</a>\r\n                                    </div>', 2, 2),
(9, '2020-05-13 10:54:58', '2020-08-06 07:42:53', 'النفاذ إلى المعلومة', 'position-accesInfos', 'Lien6', NULL, 'PUBLISHED', NULL, 'النفاذ إلى المعلومة', NULL, '<p>تطبيقا لمقتضيات القانون الأساسي عدد 22 لسنة 2016، المؤرخ في 24 مارس 2016، المتعلق بالحق في النفاذ إلى المعلومة لكل شخص طبيعي أو معنوي في النفاذ إلى الوثائق الإدارية التي تم إعدادها أو حفظها من قبل مصالح الإدارة المركزية أو الجهوية أو الهياكل الراجعة بالنظر لوزارة الشؤون الدّينيّة،</p>\r\n<div class=\"voting-btns mt20\"><a class=\"sm-tellow-btn disp-block mt20\" href=\"/citoyen\" target=\"_blank\" rel=\"noopener\">مطلب نفاذ إلى المعلومة</a></div>', 1, NULL),
(10, '2020-05-13 10:54:58', '2020-07-01 10:00:17', 'الخلية المركزية للحوكمة', 'position-hawkma', 'Lien1', '<p>yhtdyt</p>', 'PUBLISHED', NULL, 'الخلية المركزية للحوكمة', NULL, '<p>هي نظام للرقابة والتوجيه على المستوى المؤسّسي، يحدد المسؤوليات والحقوق والعلاقات مع جميع الفئات المعنية ويوضح القواعد والإجراءات اللازمة لصنع القرارات الرشيدة المتعلقة بعمل الهيكل. وهي نظام يدعم العدالة والشفافية والمساءلة ويعزّز الثقة والمصداقية في بيئة العمل.</p>\r\n<div class=\"voting-btns mt30\"><a class=\"sm-green-btn disp-block ml10\" href=\"/denonciation\" rel=\"noopener\"> التبليغ عن حالات فساد </a></div>', 2, 2),
(11, '2020-05-13 10:54:58', '2020-05-20 16:31:46', 'الحج و العمرة', 'position-thumbnail2', 'Lien1', NULL, 'PUBLISHED', NULL, 'الحج و العمرة', NULL, NULL, 3, 8),
(12, '2020-05-13 10:54:58', '2020-05-20 16:30:39', 'المراجع القانونية', 'position-thumbnail1', 'Lien1', NULL, 'PUBLISHED', NULL, 'المراجع القانونية', NULL, NULL, 3, 6),
(13, '2020-05-13 10:54:58', '2020-05-20 16:30:02', 'Ref. legislative', 'position-thumbnail3', 'Lien1', NULL, 'PUBLISHED', NULL, 'العلاقة مع المواطن', NULL, NULL, 3, 7),
(14, '2020-05-13 10:54:58', '2020-05-20 16:31:16', 'التصرف في الميزانية حسب الأهداف', 'position-thumbnail4', 'Lien1', NULL, 'PUBLISHED', NULL, 'التصرف في الميزانية حسب الأهداف', NULL, NULL, 3, 9),
(15, '2020-05-13 10:54:58', '2020-05-20 16:34:15', 'أدلة الإجراءات الإدارية', 'position-thumbnail5', 'Lien1', NULL, 'PUBLISHED', NULL, 'أدلة الإجراءات الإدارية', NULL, NULL, 3, 10),
(16, '2020-05-13 10:54:58', '2020-05-20 16:34:51', 'دليل الهياكل الإدارية', 'position-thumbnail6', 'Lien1', NULL, 'PUBLISHED', NULL, 'دليل الهياكل الإدارية', NULL, NULL, 3, 11),
(17, '2020-05-13 10:54:58', '2020-05-20 16:33:51', 'التعاون الدولي و العلاقات الخارجية', 'position-thumbnail7', 'Lien1', NULL, 'PUBLISHED', NULL, 'التعاون الدولي و العلاقات الخارجية', NULL, NULL, 3, 13),
(18, '2020-05-13 10:54:58', '2020-05-20 16:35:16', 'معالم دينية تونسية', 'position-thumbnail8', 'Lien1', NULL, 'PUBLISHED', NULL, 'معالم دينية تونسية', NULL, NULL, 3, 12),
(19, '2020-05-13 10:54:58', '2020-05-13 10:54:59', 'المكتبة المرئية و السمعية', 'position-media', 'media', NULL, 'PUBLISHED', NULL, 'المكتبة المرئية و السمعية', NULL, NULL, 1, NULL),
(20, '2020-05-13 10:54:58', '2020-05-13 10:54:59', 'منشورات و بحوث', 'position-reading', 'readingLibrary', NULL, 'PUBLISHED', NULL, 'منشورات و بحوث', NULL, NULL, 1, NULL),
(21, '2020-05-13 10:54:58', '2020-05-13 10:54:59', 'ألبوم الصور', 'position-gallerie', 'gallerie', NULL, 'PUBLISHED', NULL, 'ألبوم الصور', NULL, NULL, 1, NULL),
(22, '2020-05-13 10:54:58', '2020-05-13 10:54:59', 'إستطلاع الرأي', 'position-poll', 'poll', NULL, 'PUBLISHED', NULL, 'إستطلاع الرأي', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `actualites`
--

CREATE TABLE `actualites` (
  `id` int(10) UNSIGNED NOT NULL,
  `titre_fr` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `vignette` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `titre_ar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_ar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_en` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_en` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ATTENTE',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `lien` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_publication` date DEFAULT NULL,
  `carousel` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `nv_onglet` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `creerPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifierPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `annuaire_etablissements`
--

CREATE TABLE `annuaire_etablissements` (
  `id` int(10) UNSIGNED NOT NULL,
  `adresse_fr` varchar(255) DEFAULT NULL,
  `adresse_ar` varchar(255) DEFAULT NULL,
  `adresse_en` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `E_mail` varchar(255) DEFAULT NULL,
  `description_fr` text DEFAULT NULL,
  `description_ar` text DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `libelle_fr` varchar(255) DEFAULT NULL,
  `libelle_en` varchar(255) DEFAULT NULL,
  `libelle_ar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ATTENTE',
  `slug` varchar(255) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `creerPar` varchar(255) DEFAULT NULL,
  `modifierPar` varchar(255) DEFAULT NULL,
  `approuverPar` varchar(255) DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL,
  `googlemaps_marker` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `annuaire_etablissements`
--

INSERT INTO `annuaire_etablissements` (`id`, `adresse_fr`, `adresse_ar`, `adresse_en`, `tel`, `fax`, `E_mail`, `description_fr`, `description_ar`, `description_en`, `libelle_fr`, `libelle_en`, `libelle_ar`, `created_at`, `updated_at`, `seo_title`, `meta_description`, `meta_keywords`, `status`, `slug`, `featured`, `creerPar`, `modifierPar`, `approuverPar`, `approuverLe`, `depublierLe`, `googlemaps_marker`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">تم إحداث المعهد العالي للعلوم الإسلامية بالقيروان بمقتضى:<a style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: middle; color: #48822e; text-decoration: none; float: left;\" href=\"storage/Administration/Decret2014_3474.pdf\" target=\"_blank\" rel=\"noopener\">الأمر عدد 3474 لسنة 2014 مؤرخ في 23 سبتمبر 2014.</a></span></strong></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">ويضبط مهام المعهد وتنظيمه الإداري والمالي:<a style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: middle; color: #48822e; text-decoration: none; float: left;\" href=\"storage/Administration/Decret-1197.pdf\" target=\"_blank\" rel=\"noopener\">الأمر عدد 1197 لسنة 2015 المؤرّخ في 27 أوت 2015.</a></span></strong></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">- حدد مقر المعهد بمدينة القيروان.</span></strong></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">تمّ تغيير اسم المعهد من المعهد العالي للخطابة والإرشاد الديني بالقيروان إلى المعهد العالي للعلوم الإسلامية بالقيروان بمقتضى<a style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: middle; color: #48822e; text-decoration: none; float: left;\" href=\"storage/Administration/Decret2019_21Ar.pdf\" target=\"_blank\" rel=\"noopener\">الأمر الحكومي عدد 21 لسنة 2019 المؤرّخ في 08 جانفي 2019.</a></span></strong></p>\r\n<p>&nbsp;</p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: bold; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">- يخضع المعهد للإشراف المزدوج لوزارة الشؤون الدينية ووزارة التعليم العالي والبحث العلمي وتكنولوجيا المعلومات والاتصال.</span></strong></p>', NULL, 'Institut supérieur des sciences islamiques de Kairouan', 'Higher Institute of Islamic Sciences of Kairouan', 'المعهد العالي للعلوم الإسلامية بالقيروان', NULL, '2020-06-18 09:08:35', NULL, NULL, NULL, 'PUBLISHED', 'institut-superieur-des-sciences-islamiques-de-kairouan', 2, '1', '1', NULL, NULL, NULL, NULL),
(2, NULL, '12 شارع علي طراد منفلوري _ تونس 1008', NULL, '71337188- 71335156', '71337085', NULL, NULL, '<p style=\"text-align: right;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; font-family: Tahoma; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">&nbsp;يخضع المعهد الأعلى للشريعة بتونس لإشراف وزارة الشؤون الدينية بمقتضى:</span></strong></p>\r\n<p style=\"text-align: right;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; font-family: Tahoma; text-align: justify;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\"><a style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: middle; color: #48822e;\" href=\"storage/Administration/loi95-1996.pdf\" target=\"_blank\" rel=\"noopener\">القانون عدد 95 لسنة 1996 المؤرّخ في 6 نوفمبر 1996</a></span></strong><br /></span></strong></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important; text-align: right;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">يضبط مهام المعهد وتنظيمه الإداري والمالي:<a style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: middle; color: #48822e; text-decoration: none; float: left;\" href=\"#\" target=\"_blank\" rel=\"noopener\">الأمر عدد 1982 لسنة 1997 المؤرّخ في 6 أكتوبر 1997 والمُنقّح بالأمر عدد 1020 لسنة 2004 المؤرخ في 26 أفريل 2004</a></span></strong></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important; text-align: right;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">- تتمثل المهمة العامة التي يضطلع بها المعهد الأعلى للشريعة في التكوين المستمر للإطارات الدينية من أجل قيامها بعملها على أحسن وجه</span></strong></p>\r\n<p style=\"text-align: right;\">&nbsp;</p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important; text-align: right;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">- كما يساهم في إعداد برامج وتنظيم ندوات ودورات تكوينية على المستويين الجهوي والمحلي لفائدة متفقدي الشعائر الدينية والوعاظ والأيمة</span></strong></p>', NULL, 'The Higher Institute of Sharia', NULL, 'المعهد الأعلى للشريعة', NULL, '2020-06-18 08:51:49', NULL, NULL, NULL, 'PUBLISHED', 'the-higher-institute-of-sharia', 1, '1', '1', NULL, NULL, NULL, NULL),
(3, NULL, 'نهج 3 سبتمبر 1934 _ ص.ب 767_ 4000 سوسة', NULL, '73335256', '73335255', 'contact@ceredicrec.rnrt.tn', NULL, '<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">تم إحداث مركز البحوث و الدراسات في حوار الحضارات والأديان المقارنة بمقتضى:<a style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 13px; vertical-align: middle; color: #48822e; text-decoration: none; float: left;\" href=\"storage/Administration/Decret2005_1855.pdf\" target=\"_blank\" rel=\"noopener\">الأمر عدد 1855 المؤرخ في 27 جوان 2005.</a></span></strong></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">والذي يضبط مهامه وتنظيمه الإداري والمالي وطرق تسييره.</span></strong></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; حدد مقر المركز بمدينة سوسة.</span></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; يخضع للإشراف المزدوج لوزارة الشؤون الدينية ووزارة التعليم العالي والبحث العلمي والتكنولوجيا.</span></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; تتمثل مهامه في :</span></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; القيام بالبحث المعمق والدراسات العلمية في حوار الحضارات والأديان المقارنة.<br /></span></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; تنظيم التظاهرات والندوات والملتقيات العلمية بالتعاون مع المؤسسات والهيئات الوطنية والدولية المختصّة.</span></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; إحداث مرصد وبنوك وقواعد معلومات في مجالات &nbsp;حوار الحضارات والأديان المقارنة.</span></p>\r\n<p>&nbsp;</p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; font-size: 11px; vertical-align: middle; line-height: 1.5em; color: #444444; font-family: Tahoma !important;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; نشر البحوث والدراسات المنجزة من قبل المركز في شكل كتب&nbsp;<span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">وإصدارات مرئية أو مسموعة أو إلكترونيّة</span>.&nbsp;&nbsp;&nbsp;&nbsp;</span></p>\r\n<p class=\"bodytext\" style=\"margin: 0px; padding: 10px; border: 0px; outline: 0px; vertical-align: middle; line-height: 1.5em;\"><span style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: small; vertical-align: middle;\">&nbsp; &nbsp; &nbsp; &nbsp; موقع الواب:www ceredicrec.rnrt.tn.</span><span style=\"font-size: small;\">&nbsp;&nbsp;</span></p>', NULL, NULL, NULL, 'مركز البحوث و الدراسات في حوار الحضارات و الأديان المقارنة', NULL, '2020-06-18 09:08:13', NULL, NULL, NULL, 'PUBLISHED', '334848029', 1, '1', '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `appels_offres`
--

CREATE TABLE `appels_offres` (
  `id` int(10) UNSIGNED NOT NULL,
  `titre_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `titre_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_ar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_en` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ATTENTE',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `pieces_jointes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titrepiece_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titrepiece_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titrepiece_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `creerPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifierPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL,
  `fichier_resultat` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `titre_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contenu_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `contenu_ar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `contenu_en` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ATTENTE',
  `featured` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ListStatistiques` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `creerPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifierPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL,
  `fichiers` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `titre_fr`, `titre_ar`, `titre_en`, `contenu_fr`, `contenu_ar`, `contenu_en`, `images`, `seo_title`, `meta_description`, `meta_keywords`, `slug`, `status`, `featured`, `deleted_at`, `created_at`, `updated_at`, `ListStatistiques`, `creerPar`, `modifierPar`, `approuverPar`, `approuverLe`, `depublierLe`, `fichiers`) VALUES
(5, 'Présentation de la ville', 'تقديم المدينة', NULL, NULL, '<p style=\"text-align: right;\">.تعتبر عوسجة منطقة فلاحيه باعتبار أهمية النشاط الفلاحي بها تحتوي أيضا على نشاط صناعي من خلال 5 وحدات صناعية مصدرة كليا للخياطة و مجمع بريد و منشأة بنكية و مركز بريد</p>\r\n<p style=\"text-align: right;\">.تتميز مدينة عوسجة بسوقها الأسبوعي يوم الأحد الذي يتميز بحركة تجارية كبرى باعتبار موقع المدينة المميز كنقطة عبور و باعتبار طبيعة المنتوج ألفلاحي به الطازج و لذي يشجع على ارتياد السوق من مناطق مختلفة</p>\r\n<p style=\"text-align: right;\">تتميز المدينة بثروة طبيعية هامة و أرض خصبة . كما تتميز بسد جبلي بمنطقة - سيدي حسين- يشكل ثروة مائية هامة</p>', NULL, '[]', 'Présentation de la ville', '.تعتبر عوسجة منطقة فلاحيه باعتبار أهمية النشاط الفلاحي بها تحتوي أيضا على نشاط صناعي من خلال 5 وحدات صناعية مصدرة كليا للخياطة و مجمع بريد و منشأة بنكية و مركز بريد', '.تعتبر عوسجة منطقة فلاحيه باعتبار أهمية النشاط الفلاحي بها تحتوي أيضا على نشاط صناعي من خلال 5 وحدات صناعية مصدرة كليا للخياطة و مجمع بريد و منشأة بنكية و مركز بريد', 'presentation-de-la-ville', 'PUBLISHED', 0, NULL, '2019-10-04 10:49:39', '2022-10-25 14:19:15', NULL, '1', '1', NULL, NULL, NULL, '[]'),
(6, 'Situation géographique', 'الموقع الجغرافي', NULL, NULL, '<div id=\"tm-block-footer\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">\r\n<div class=\"uk-container uk-container-center\">\r\n<section class=\" tm-block-footer uk-grid uk-grid-match uk-grid-collapse\" data-uk-grid-match=\"{target:\'&gt; div &gt; .uk-panel\'}\" data-uk-grid-margin=\"\">\r\n<div class=\"uk-width-1-1 uk-width-medium-1-3\">\r\n<div class=\"uk-panel uk-panel-box jmoddiv\" data-jmodediturl=\"https://commune-aousja.tn/index.php?option=com_config&amp;controller=config.display.modules&amp;id=548&amp;Itemid=1143&amp;return=aHR0cHM6Ly9jb21tdW5lLWFvdXNqYS50bi9pbmRleC5waHA%2Fb3B0aW9uPWNvbV9jb250ZW50JnZpZXc9YXJ0aWNsZSZpZD0xMTAmSXRlbWlkPTExNDMmbGFuZz1hcg%3D%3D\" data-target=\"_self\" data-jmodtip=\"&lt;strong&gt;تحرير الموديول&lt;/strong&gt;&lt;br /&gt;روابط مفيدة&lt;br /&gt;الموضع: block-footer\">&nbsp;</div>\r\n</div>\r\n</section>\r\n</div>\r\n</div>\r\n<div class=\"tm-inner-container uk-container uk-container-center\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">\r\n<div class=\"tm-container\">\r\n<div id=\"tm-middle\" class=\"tm-middle uk-grid\" data-uk-grid-match=\"\" data-uk-grid-margin=\"\">\r\n<div class=\"tm-main uk-width-medium-1-1\"><main id=\"tm-content\" class=\"tm-content\">\r\n<article class=\"uk-article tm-article\">\r\n<div class=\"tm-article-wrapper\">\r\n<div class=\"tm-article-content uk-margin-top-remove\">\r\n<div class=\"tm-article\">\r\n<p style=\"text-align: right;\">توجد&nbsp;&nbsp;مدينة عوسجة بالشمال الشرقي للجمهورية التونسية، بين مدينتي رأس الجبل والعالية، على بعد 48 كم شمالي تونس العاصمة. و 26 كم&nbsp;&nbsp;عن&nbsp;&nbsp;مدينة&nbsp;&nbsp;بنزرت&nbsp;&nbsp;الولاية.&nbsp;&nbsp;وهي تابعة لولاية بنزرت ومعتمدية غار الملح.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</article>\r\n</main></div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'situation-geographique', 'PUBLISHED', 0, NULL, '2019-11-06 09:32:21', '2022-10-25 14:54:49', NULL, '1', '1', NULL, NULL, NULL, '[]'),
(7, 'La ville en chiffres', 'المدينة بالأرقام', NULL, '<p><img style=\"display: block; margin-left: auto; margin-right: auto; width: 859px; height: 500px;\" src=\"/public/storage/articles/August2020/ville-en-chiffre.png\" alt=\"\" width=\"1021\" height=\"266\" /></p>', '<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"/storage/articles/August2020/ville-en-chiffre.png\" alt=\"\" width=\"859\" height=\"500\" /></p>', NULL, '[]', NULL, NULL, NULL, 'la-ville-en-chiffres', 'PUBLISHED', 0, NULL, '2019-11-06 09:32:42', '2020-10-21 12:52:09', NULL, '1', '1', NULL, NULL, NULL, '[]'),
(8, 'Lieux touristiques', 'المواقع السياحية', NULL, NULL, NULL, NULL, '[]', NULL, NULL, NULL, 'lieux-touristiques', 'PUBLISHED', 0, NULL, '2019-11-06 09:35:25', '2019-11-06 09:35:25', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(9, 'Présentation de la mairie', 'تقديم البلدية', NULL, NULL, '<div id=\"tm-block-footer\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">\r\n<div class=\"uk-container uk-container-center\">\r\n<section class=\" tm-block-footer uk-grid uk-grid-match uk-grid-collapse\" data-uk-grid-match=\"{target:\'&gt; div &gt; .uk-panel\'}\" data-uk-grid-margin=\"\">\r\n<div class=\"uk-width-1-1 uk-width-medium-1-3\">\r\n<div class=\"uk-panel uk-panel-box jmoddiv\" data-jmodediturl=\"https://commune-aousja.tn/index.php?option=com_config&amp;controller=config.display.modules&amp;id=548&amp;Itemid=1147&amp;return=aHR0cHM6Ly9jb21tdW5lLWFvdXNqYS50bi9pbmRleC5waHA%2Fb3B0aW9uPWNvbV9jb250ZW50JnZpZXc9YXJ0aWNsZSZpZD0xMTMmSXRlbWlkPTExNDcmbGFuZz1hcg%3D%3D\" data-target=\"_self\" data-jmodtip=\"&lt;strong&gt;تحرير الموديول&lt;/strong&gt;&lt;br /&gt;روابط مفيدة&lt;br /&gt;الموضع: block-footer\">&nbsp;</div>\r\n</div>\r\n</section>\r\n</div>\r\n</div>\r\n<div class=\"tm-inner-container uk-container uk-container-center\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">\r\n<div class=\"tm-container\">\r\n<div id=\"tm-middle\" class=\"tm-middle uk-grid\" data-uk-grid-match=\"\" data-uk-grid-margin=\"\">\r\n<div class=\"tm-main uk-width-medium-1-1\"><main id=\"tm-content\" class=\"tm-content\">\r\n<article class=\"uk-article tm-article\">\r\n<div class=\"tm-article-wrapper\">\r\n<div class=\"tm-article-content uk-margin-top-remove\">\r\n<div class=\"tm-article\">\r\n<p>أحدثت بلدية&nbsp;&nbsp;عوسجة&nbsp;&nbsp;بمقتضى الأمر عدد 181&nbsp;&nbsp;بتاريخ 26 جوان 1967 .</p>\r\n</div>\r\n</div>\r\n</div>\r\n</article>\r\n</main></div>\r\n</div>\r\n</div>\r\n</div>\r\n<p><span style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium;\">&nbsp;</span></p>\r\n<div id=\"tm-block-footer\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium;\">\r\n<div class=\"uk-container uk-container-center\">\r\n<section class=\" tm-block-footer uk-grid uk-grid-match uk-grid-collapse\" data-uk-grid-match=\"{target:\'&gt; div &gt; .uk-panel\'}\" data-uk-grid-margin=\"\">\r\n<div class=\"uk-width-1-1 uk-width-medium-1-3\">\r\n<div class=\"uk-panel uk-panel-box jmoddiv\" data-jmodediturl=\"https://commune-aousja.tn/index.php?option=com_config&amp;controller=config.display.modules&amp;id=548&amp;Itemid=1147&amp;return=aHR0cHM6Ly9jb21tdW5lLWFvdXNqYS50bi9pbmRleC5waHA%2Fb3B0aW9uPWNvbV9jb250ZW50JnZpZXc9YXJ0aWNsZSZpZD0xMTMmSXRlbWlkPTExNDcmbGFuZz1hcg%3D%3D\" data-target=\"_self\" data-jmodtip=\"&lt;strong&gt;تحرير الموديول&lt;/strong&gt;&lt;br /&gt;روابط مفيدة&lt;br /&gt;الموضع: block-footer\">&nbsp;</div>\r\n</div>\r\n</section>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'presentation-de-la-mairie', 'PUBLISHED', 0, NULL, '2019-11-06 09:40:48', '2022-10-25 14:59:43', NULL, '1', '1', NULL, NULL, NULL, '[]'),
(10, 'Services municipaux', 'المصالح البلدية', NULL, NULL, '<p dir=\"rtl\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium;\"><strong>تشتمل الإدارة&nbsp;&nbsp;البلدية على&nbsp;&nbsp;المصالح&nbsp;&nbsp;التالية :</strong></p>\r\n<p dir=\"rtl\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium;\">&nbsp;&diams;&nbsp;الكتابة العامة.</p>\r\n<p dir=\"rtl\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium;\">&nbsp;&diams;&nbsp;قسم الحالة&nbsp;&nbsp;المدنية .</p>\r\n<p dir=\"rtl\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium;\">&nbsp;&diams;&nbsp;مكتب الضبط&nbsp;&nbsp;قبول الشكاوي.</p>\r\n<p dir=\"rtl\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium;\">&nbsp;توفر هذه المصالح خدمة مميزة للمتعاملين مع ادارة&nbsp;&nbsp;بلدية عوسجة .</p>\r\n<p dir=\"rtl\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium;\">كما تشتمل على مصلحة النظافة التي تعمل على تامين وضع بيئي سليم بالمنطقة من خال تدخلات&nbsp;&nbsp;ميدانية&nbsp;&nbsp;يومة و حملات&nbsp;&nbsp;دورية&nbsp;&nbsp;من&nbsp;&nbsp;&nbsp;أجل&nbsp;&nbsp;عوسجة أجمل.</p>', NULL, '[]', NULL, NULL, NULL, 'services-municipaux', 'PUBLISHED', 0, NULL, '2019-11-06 09:41:13', '2022-10-25 15:01:09', NULL, '1', '1', NULL, NULL, NULL, '[]'),
(11, 'Horaire de Travail', 'توقيت العمل', NULL, '<h5 class=\"uk-module-title-alt\">&nbsp;</h5>\r\n<div class=\"col-md-12\">\r\n<div class=\"col-md-4\">\r\n<h5>Horaires d&rsquo;hivers</h5>\r\n<p><strong>Date effet/fin :&nbsp;Du 1er jan. au 30 juin&nbsp;et du 1er sept. au 31 d&eacute;c.</strong></p>\r\n<p><strong>Jours:<br /></strong><strong>Du lundi au jeudi&nbsp;<br /></strong>Matin: De 8h:30 &agrave; 12h&nbsp;:30<br />Apr&eacute;s-midi : De 13h&nbsp;:30 &agrave; 17h&nbsp;:30</p>\r\n<p><strong>Vendredi&nbsp;<br /></strong>Matin: De 8h:30 &agrave; 13h&nbsp;</p>\r\n<p>Apr&eacute;s-midi : De 14h:30 &agrave; 17h&nbsp;:30</p>\r\n</div>\r\n<div class=\"col-md-4\">\r\n<h5>Horaires d\'&eacute;t&eacute;</h5>\r\n<p><strong>Date effet/fin :&nbsp;Du 1er juil. au 31 aout.</strong></p>\r\n<p><strong>Jours:&nbsp;</strong></p>\r\n<p><strong>Du lundi au jeudi&nbsp;<br /></strong>De 7h:30 &agrave; 14h</p>\r\n<p><strong>Vendredi</strong></p>\r\n<p>De 7h:30 &agrave; 13h</p>\r\n</div>\r\n<div class=\"col-md-4\">\r\n<h5>Mois de Ramadan</h5>\r\n<p><strong>Du lundi au jeudi&nbsp;<br /></strong>De 7h:30 &agrave; 14h</p>\r\n<p><strong>Vendredi</strong></p>\r\n<p>De 7h:30 &agrave; 13h</p>\r\n</div>\r\n</div>', '<h5 class=\"uk-module-title-alt\">&nbsp;</h5>\r\n<div class=\"col-md-12\">\r\n<div class=\"col-md-4\">\r\n<div class=\"uk-width-medium-1-3\">\r\n<h5 class=\"uk-module-title-alt\">التوقيت الشتوي</h5>\r\n<ul style=\"list-style-type: square;\">\r\n<li style=\"font-weight: 300;\">&nbsp;من الاثنين إلى الخميس :</li>\r\n</ul>\r\n<p>الحصة الصباحية:&nbsp; من س 8.30 إلى س 12.30</p>\r\n<p style=\"font-weight: 300;\">الحصة المسائية:&nbsp; من س 13.30 إلى س 17.30</p>\r\n<ul style=\"list-style-type: square;\">\r\n<li style=\"font-weight: 300;\">&nbsp;الجمعة :</li>\r\n</ul>\r\n<p>الحصة الصباحية :&nbsp;من س 8.00 إلى س 13.00</p>\r\n<p>الحصة المسائية : من س 14.30 إلى س 17.30</p>\r\n</div>\r\n</div>\r\n<div class=\"col-md-4\">\r\n<div class=\"uk-width-medium-1-3\">\r\n<h5 class=\"uk-module-title-alt\">التوقيت الصيفي</h5>\r\n<ul style=\"list-style-type: square;\">\r\n<li style=\"font-weight: 300;\">من الاثنين إلى الخميس :</li>\r\n</ul>\r\n<p>حصة واحدة :&nbsp;من س 7.30 إلى س 14.00</p>\r\n<ul style=\"list-style-type: square;\">\r\n<li style=\"font-weight: 300;\">&nbsp;الجمعة :</li>\r\n</ul>\r\n<p>حصة واحدة :&nbsp;من س 7.30 إلى س 13.00</p>\r\n</div>\r\n</div>\r\n<div class=\"col-md-4\">\r\n<div class=\"uk-width-medium-1-3 uk-row-first\">\r\n<h5 class=\"uk-module-title-alt\">التوقيت خلال شهر رمضان</h5>\r\n<ul style=\"list-style-type: square;\">\r\n<li style=\"font-weight: 300;\">&nbsp;من الاثنين إلى الخميس :</li>\r\n</ul>\r\n<p>حصة واحدة :&nbsp;من س 8.00 إلى س 14.30</p>\r\n<ul style=\"list-style-type: square;\">\r\n<li style=\"font-weight: 300;\">&nbsp;الجمعة :</li>\r\n</ul>\r\n<p>حصة واحدة :&nbsp;من س 7.30 إلى س 13.00</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'horaire-de-travail', 'PUBLISHED', 0, NULL, '2019-11-06 09:42:28', '2019-11-06 09:54:20', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(12, 'Légalisation de signature', 'التعريف بالامضاء', NULL, '<p>&nbsp;</p>\r\n<ul>\r\n<li>\r\n<h5><span style=\"color: #ff0000;\"><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap;\">Formalit&eacute;s-obligatoires</span></span></h5>\r\n</li>\r\n</ul>\r\n<p><span style=\"font-family: \'Varela Round\'; font-size: 16px;\">Le document est pr&eacute;sent&eacute; personnellement par l\'int&eacute;ress&eacute; aux agents du service de l\'Etat civil. Seul est exempt de cette obligation quiconque a d&eacute;pos&eacute; un sp&eacute;cimen de sa signature suivant les formalit&eacute;s ci-dessous d&eacute;sign&eacute;es.</span></p>\r\n<ul>\r\n<li>\r\n<h5><span style=\"color: #ff0000;\"><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap;\">Pi&egrave;ces d\'identit&eacute;s &agrave; pr&eacute;senter</span></span></h5>\r\n</li>\r\n</ul>\r\n<p>La l&eacute;galisation de signature est effectu&eacute;e apr&egrave;s pr&eacute;sentation de l\'une des pi&egrave;ces d\'identit&eacute; officielles suivantes en cours de validit&eacute;:</p>\r\n<ul>\r\n<li style=\"list-style-type: none;\">\r\n<ul>\r\n<li>La carte d\'identit&eacute; nationale.</li>\r\n<li>La carte d\'identit&eacute; r&eacute;serv&eacute;e aux &eacute;trangers et d&eacute;livr&eacute;e par la direction de la s&ucirc;ret&eacute; nationale.</li>\r\n<li>Le passeport</li>\r\n</ul>\r\n</li>\r\n<li>\r\n<h5><span style=\"color: #ff0000;\"><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap;\">Le sp&eacute;cimen de signature</span></span></h5>\r\n</li>\r\n</ul>\r\n<table class=\"table-relation\" style=\"width: 800px; border-style: solid; border-color: #000000; margin-left: auto; margin-right: auto; height: 169px;\" border=\"1\" align=\"center\">\r\n<tbody>\r\n<tr class=\"table-TitreRelation\" style=\"height: 13px;\">\r\n<td style=\"width: 549px; height: 13px; text-align: center;\"><span style=\"color: #000000;\"><strong>Nombre de copies</strong></span></td>\r\n<td style=\"width: 235px; height: 13px; text-align: center;\"><span style=\"color: #000000;\"><strong>Taxe</strong></span></td>\r\n</tr>\r\n<tr style=\"height: 52px;\">\r\n<td style=\"width: 549px; height: 52px; text-align: center;\">jusqu\'&agrave; un maximum de 3 copies de la m&ecirc;me pi&egrave;ce</td>\r\n<td style=\"width: 235px; height: 52px; text-align: center;\">1 Signature = 0,500 D<br />2 Signatures = 1,000 D<br />3 Signatures = 1,500 D<br />4 Signatures = 2,000 D</td>\r\n</tr>\r\n<tr style=\"height: 52px;\">\r\n<td style=\"width: 549px; height: 52px; text-align: center;\">de 4 &agrave; 6 copies de la m&ecirc;me pi&egrave;ce</td>\r\n<td style=\"width: 235px; height: 52px; text-align: center;\">1 Signature = 1,000 D<br />2 Signatures = 2,000 D<br />3 Signatures = 3,000 D<br />4 Signatures = 4,000 D</td>\r\n</tr>\r\n<tr style=\"height: 52px;\">\r\n<td style=\"width: 549px; height: 52px; text-align: center;\">de 7 &agrave; 9 copies de la m&ecirc;me pi&egrave;ce</td>\r\n<td style=\"width: 235px; height: 52px; text-align: center;\">1 Signature = 1,500 D<br />2 Signatures = 3,000 D<br />3 Signatures = 4,500 D<br />4 Signatures = 6,000 D</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<ul>\r\n<li>\r\n<h5><span style=\"color: #ff0000;\"><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap;\">Taxes et redevances</span></span></h5>\r\n</li>\r\n</ul>\r\n<p>Tout particulier qui demande fr&eacute;quemment la l&eacute;galisation de sa signature peut en d&eacute;poser personnellement le sp&eacute;cimen aupr&egrave;s du service de l\'&eacute;tat civil.</p>\r\n<ul>\r\n<li>\r\n<h5><span style=\"color: #ff0000;\"><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap;\">Notes</span></span></h5>\r\n</li>\r\n</ul>\r\n<p><span style=\"color: #000000;\"><strong>N.B :&nbsp;</strong></span></p>\r\n<p><span style=\"color: #000000;\">La l&eacute;galisation de signature est interdite en ce qui concerne les documents contraires aux bonnes moeurs ou portant atteinte &agrave; l\'ordre public. Les documents administratifs pr&eacute;sent&eacute;s par les services de l\'&eacute;tat, des collectivit&eacute;s locales et des &eacute;tablissements publics &agrave; caract&egrave;re administratif sont exempt&eacute;s du payement des redevances.</span></p>', '<p>&nbsp;</p>\r\n<ul>\r\n<li>\r\n<h5><span style=\"color: #ff0000;\">المراجع التشريعية و الترتيبية</span></h5>\r\n</li>\r\n</ul>\r\n<ol>\r\n<li style=\"list-style-type: none;\">\r\n<ol>\r\n<li>القانون عدد 103 لسنة 1994 المؤرخ في غرة أوت 1994 المتعلق بتنظيــــم التعريف بالإمضاء والإشهاد بمطابقة النسخ للأصل كما وقع تنقيحه و إتمامه بالقانون عدد 19 لسنة 1999 المؤرخ في غرة مارس 1999</li>\r\n<li>القانون عدد 27 لسنــة 1993 المؤرخ في 22 مارس 1993 المتعلـق ببطاقة التعريــف الوطنيـــة كما وقــع تنقيحــه وإتمامــه بالقانــون عــــدد 18 لسنـــة 1999 المــؤرخ فــــي غرة مارس 1999</li>\r\n<li>الأمر عدد 1968 لسنة 1994 المؤرخ في 26 سبتمبر 1994 المتعلق بضبط قائمة</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<ul>\r\n<li>\r\n<h5><span style=\"color: #ff0000;\">الوثائق الرسمية المعتمدة للتعريف بالإمضاء</span></h5>\r\n</li>\r\n</ul>\r\n<ol>\r\n<li style=\"list-style-type: none;\">\r\n<ol>\r\n<li>الأمر عدد 1969 لسنة 1994 المؤرخ في 26 سبتمبر 1994 المتعلق بضبط تعريفة المعلوم المستخلص مقابل التعريف بالإمضاء والإشهاد بمطابقة النسخ للأصل</li>\r\n<li>الفصل 378 من مجلة الحقوق العينية.</li>\r\n<li>قرار وزير الداخلية المؤرخ في 16 ديسمبر 1995</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<ul>\r\n<li>\r\n<h5><span style=\"color: #ff0000;\">شـــروط الانتفـــاع بالخدمــــة</span></h5>\r\n</li>\r\n</ul>\r\n<ol>\r\n<li style=\"list-style-type: none;\">\r\n<ol>\r\n<li>أن تكون الوثيقة المقدمة للتعريف بالإمضاء\r\n<ul>\r\n<li>- غير منافية للأخلاق وغير مخلة بالنظام العام</li>\r\n<li>- محررة باللغة العربية أو بلغة مستعملة عموما بالإدارة</li>\r\n</ul>\r\n</li>\r\n<li>أن تتوفر في طالب الخدمة الشروط القانونية فيما يتعلق بالأهلية القانونية للإمضاء</li>\r\n<li>أن يكون حاملا لوثيقة رسمية تثبت هويته ( بطاقة تعريف وطنية أو جواز سفر ساري المفعول)</li>\r\n<li>أن يحضر ويمضي بنفسه أمام العون (باستثناء حالات الإمضاء المودعة بدفاتر البلدية(</li>\r\n<li>دفع المعلوم الموظف</li>\r\n</ol>\r\n</li>\r\n</ol>\r\n<ul>\r\n<li>\r\n<h5><span style=\"color: #ff0000;\">الوثائــــق المطلوبــــة</span></h5>\r\n<ul>\r\n<li>الوثيقة المراد التعريف بها</li>\r\n<li>الوثيقة الرسمية لإثبات الهوية (بطاقة التعريف، جواز سفر)</li>\r\n</ul>\r\n</li>\r\n<li>\r\n<h5><span style=\"color: #ff0000;\">مكـــــان إيــــداع الملــــف</span></h5>\r\n<ul>\r\n<li>قسم الحالة المدنية بالبلدية أو بالدائرة البلدية</li>\r\n<li>المعتمدية خارج المنطقة البلدية</li>\r\n</ul>\r\n</li>\r\n<li>\r\n<h5><span style=\"color: #ff0000;\">أجل الحصول على الخدمة</span></h5>\r\n<ul>\r\n<li>فــــــورا</li>\r\n</ul>\r\n</li>\r\n<li>\r\n<h5><span style=\"color: #ff0000;\">ملاحظــــات</span></h5>\r\n<ol>\r\n<li>تتم للأشخاص الأميين وغير القادرين على الإمضاء تلاوة الكتب عليهم بمحضر شاهدين من أهل الثقة مصحوبين ببطاقة التعريف والتنصيص على ذلك بالدفتر.</li>\r\n<li>الوثائق المقدمة من طرف مصالح الدولة والمؤسسات العمومية ذات الصبغة الإدارية معفية من دفع المعلوم المستوجب.</li>\r\n<li>التعريف بالإمضاء على الوثائق الخاصة بالتبرع بالأعضاء البشرية أو بالتراجع فيه تتم مجانا.</li>\r\n</ol>\r\n</li>\r\n</ul>', NULL, '[]', NULL, NULL, NULL, 'legalisation-de-signature', 'PUBLISHED', 0, NULL, '2019-11-06 10:03:47', '2019-11-06 13:54:30', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(13, 'Certification des copies', 'الإشهاد بمطابقة النسخ للأصل', NULL, '<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">Formalit&eacute;s obligatoires</span></h5>\r\n<p>Le demandeur de cette prestation doit pr&eacute;senter aux agents de service de l\'&eacute;tat civil un original de chaque copie &agrave; certifier. Ces derniers sont obligatoirement tenus de s\'assurer de la conformit&eacute; totale de la copie &agrave; son original.</p>\r\n<h5><span style=\"color: #ff0000; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap;\">Taxes et redevances</span></h5>\r\n<p>La certification de conformit&eacute; des copies &agrave; l\'original est soumise &agrave; des redevances. Le montant de ces taxes est fix&eacute; comme suit:</p>\r\n<table class=\"table-relation\" style=\"height: 52px; width: 784px; border-color: #000000; border-style: solid; margin-left: auto; margin-right: auto;\" border=\"1\" align=\"center\">\r\n<tbody>\r\n<tr style=\"height: 13px;\">\r\n<td class=\"table-TitreRelation\" style=\"height: 13px; width: 554px; text-align: center;\"><span style=\"color: #000000;\"><strong>Nombre de copies</strong></span></td>\r\n<td class=\"table-TitreRelation\" style=\"height: 13px; width: 214px; text-align: center;\"><strong><span style=\"color: #000000;\">Taxe</span></strong></td>\r\n</tr>\r\n<tr style=\"height: 13px;\">\r\n<td style=\"height: 13px; width: 554px; text-align: center;\">Par acte de certification et jusqu\'&agrave; un maximum de 3 copies de la m&ecirc;me pi&egrave;ce</td>\r\n<td style=\"height: 13px; width: 214px; text-align: center;\">0,500 D</td>\r\n</tr>\r\n<tr style=\"height: 13px;\">\r\n<td style=\"height: 13px; width: 554px; text-align: center;\">de 4 &agrave; 6 copies</td>\r\n<td style=\"height: 13px; width: 214px; text-align: center;\">1,000 D</td>\r\n</tr>\r\n<tr style=\"height: 13px;\">\r\n<td style=\"height: 13px; width: 554px; text-align: center;\">de 7 &agrave; 9 copies</td>\r\n<td style=\"height: 13px; width: 214px; text-align: center;\">1,500 D</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h5><span style=\"color: #ff0000; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap;\">Notes</span></h5>\r\n<p>La certification de conformit&eacute; des copies &agrave; l\'original est interdite en ce qui concerne les documents contraires aux bonnes moeurs ou portant atteinte &agrave; l\'ordre public.</p>\r\n<p>Les documents administratifs pr&eacute;sent&eacute;s par les services de l\'&eacute;tat, des collectivit&eacute;s locales et des &eacute;tablissements publics &agrave; caract&egrave;re administratif sont exempt&eacute;s du payement des redevances.</p>', '<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">المراجع التشريعية و الترتيبية:</span></h5>\r\n<ol>\r\n<li><span style=\"color: #000000;\">القانون عدد 103 لسنة 1994 المؤرخ في غرة أوت 1994 المتعلـــق بتنظيم التعريـف بالإمضاء والإشهاد بمطابقة النسخ للأصل كما وقع تنقيحه و إتمامه بالقانون عدد 19 لسنة 1999 المؤرخ في غرة مارس 1999</span></li>\r\n<li><span style=\"color: #000000;\">الأمر عــدد 1969 لسنة 1994 المـــؤرخ في 26 سبتمبر 1994 المتعلق بضبط تعريفة المعلوم المستخلص مقابل التعريف بالإمضاء والإشهاد بمطابقة النسخ للأصل.</span></li>\r\n<li><span style=\"color: #000000;\">قرار وزير الداخلية مؤرخ في 16 ديسمبر 1995</span></li>\r\n</ol>\r\n<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">شـروط الانتفاع بالخدمـة :</span></h5>\r\n<ol>\r\n<li><span style=\"color: #000000;\">أن تكون الوثيقة المقدمة للإشهاد بمطابقة نسخها للأصل غير منافية للأخلاق و غير مخلة بالنظام العام</span></li>\r\n<li><span style=\"color: #000000;\">أن تكون الوثيقة محررة باللغة العربية أو بلغة مستعملة عموما من طرف الإدارة المعنية بالخدمة.</span></li>\r\n<li><span style=\"color: #000000;\">خــلاص المعلــوم المستوجـــب</span></li>\r\n</ol>\r\n<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">الوثائق المطلوبـة:</span></h5>\r\n<ol>\r\n<li><span style=\"color: #000000;\">الوثيقــــة الأصليـــــــة</span></li>\r\n<li><span style=\"color: #000000;\">النسخ المراد الإشهاد بمطابقتها للأصل</span></li>\r\n<li><span style=\"color: #000000;\">الإستظهار ببطاقة تعريف مقدم الوثيقة</span></li>\r\n</ol>\r\n<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">مكان إيداع الملف:</span></h5>\r\n<ol>\r\n<li><span style=\"color: #000000;\">البلدية أو الدائرة البلدية</span></li>\r\n<li><span style=\"color: #000000;\">الإدارة السريعـــــــــة</span></li>\r\n<li><span style=\"color: #000000;\">وكالة النهوض بالصناعة</span></li>\r\n<li><span style=\"color: #000000;\">مكتب تسريح السيارات بالديوانة</span></li>\r\n<li><span style=\"color: #000000;\">المعتمدية في المناطق غير البلدية</span></li>\r\n<li><span style=\"color: #000000;\">السفارة أو القنصلية للمقيمين في الخارج.</span></li>\r\n</ol>\r\n<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">أجل الحصول على الخدمة:</span></h5>\r\n<p><span style=\"color: #000000;\">فــــــورا</span></p>\r\n<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">ملاحظات:</span></h5>\r\n<p><span style=\"color: #000000;\">الوثائق التي تستوجب مطابقتها للأصل حسب قرار وزير الداخلية والتنمية المحلية هي :</span></p>\r\n<p style=\"padding-left: 40px;\"><span style=\"color: #000000;\">- مختلف الشهادات ذات الطابع العلمي أو المدرسي</span></p>\r\n<p style=\"padding-left: 40px;\"><span style=\"color: #000000;\">- عقود الكراء</span></p>', NULL, '[]', NULL, NULL, NULL, 'certification-des-copies', 'PUBLISHED', 0, NULL, '2019-11-06 10:04:53', '2020-08-12 11:57:07', NULL, '1', '1', NULL, NULL, NULL, '[]'),
(14, 'Naissance', 'ترسيم ولادة', NULL, '<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">Formalit&eacute;s obligatoires</span></h5>\r\n<p>Vu l&rsquo;importance de cet &eacute;v&eacute;nement, il a &eacute;t&eacute; entour&eacute; d&rsquo;un ensemble de prescriptions en ce qui concerne la d&eacute;claration, le d&eacute;lai et le mode d&rsquo;&eacute;tablissement de l&rsquo;acte de naissance.</p>\r\n<h5><span style=\"color: #ff0000; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap;\">Qui d&eacute;clare ?</span></h5>\r\n<p>L&rsquo;une des personnes suivantes, par ordre de priorit&eacute; d&eacute;croissante, est tenue de d&eacute;clarer la naissance :</p>\r\n<ol>\r\n<li>Le p&egrave;re en premier lieu.</li>\r\n<li>Le m&eacute;decin ou la sage-femme.</li>\r\n<li>Toute personne qui a assist&eacute; &agrave; l&rsquo;accouchement.</li>\r\n<li>Toute autre personne chez laquelle &agrave; accouch&eacute; la femme.</li>\r\n</ol>\r\n<p>Est punie d&rsquo;une peine de 6 mois de prison assortie d&rsquo;une amende, toute personne qui ne d&eacute;clare pas la naissance.</p>\r\n<h5><span style=\"color: #ff0000; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap;\">Quand la d&eacute;claration doit-elle &ecirc;tre faite ?</span></h5>\r\n<p>La d&eacute;claration doit &ecirc;tre faite dans les 10 jours qui suivent l&rsquo;accouchement, sauf autorisation du juge du tribunal de premi&egrave;re instance du lieu de la naissance.</p>\r\n<h5><span style=\"color: #ff0000; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap;\">Qui re&ccedil;oit les d&eacute;clarations ?</span></h5>\r\n<p>Les agents du Service de l&rsquo;&eacute;tat civil.</p>\r\n<h5><span style=\"color: #ff0000; font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap;\">Notes</span></h5>\r\n<p>NB:&nbsp;\" le mort-n&eacute; n&rsquo;est pas enregistr&eacute; dans le registre des naissances, mais uniquement dans le registre des d&eacute;c&egrave;s \".</p>', '<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">المراجع التشريعية و الترتيبية:</span></h5>\r\n<ol>\r\n<li><span style=\"color: #000000;\">الفصـول 22 و 23 و 24 و 25 و 27 مـــن القانــــون عـــدد 3 لسنــة 1957 المؤرخ فـي 1 أوت 1957 المتعلق بتنظيم الحالة المدنية كما تم إتمامه و تنقيحـــه بالنصوص اللاحقـــة.</span></li>\r\n<li><span style=\"color: #000000;\">&nbsp;منشور الوزير الأول عدد 15 المؤرخ في 14 فيفري 1989 المتعلق بتبسيط الإجراءات في خصوص وثائق الحالة المدنية.</span></li>\r\n</ol>\r\n<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">شروط الانتفاع بالخدمة :</span></h5>\r\n<ol>\r\n<li><span style=\"color: #000000;\">يقع الإعلام بالولادة خلال العشرة (10) أيام التي تلي الوضع.</span></li>\r\n<li><span style=\"color: #000000;\">إذا لم يقع الإعلام بالولادة في الأجل القانوني فإنه لايمكن لضابط الحالة المدنية تضمينها بدفاتره إلا بمقتضي إذن صادر عن رئيس المحكمة الابتدائية بالجهة التي ولد بها المولود</span></li>\r\n<li><span style=\"color: #000000;\">يقع الإعلام بالولادة من طرف الأب أو الطبيب أو القابلة أو غيرهم من الأشخاص الذين شهدوا الوضع.</span></li>\r\n</ol>\r\n<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">الوثائق المطلوبة:</span></h5>\r\n<p><span style=\"color: #000000;\">الإدلاء بالإرشادات المطلوبة ( تاريخ الولادة، مكانها، اسم المولود) و تقديم ملف يحتوي على الوثائق التي تثبت هوية أب وأم المولود و من بينها :</span></p>\r\n<ol>\r\n<li><span style=\"color: #000000;\">&nbsp;بطاقة التعريف الوطنية للأب أو للأم</span></li>\r\n<li><span style=\"color: #000000;\">&nbsp;أو الدفتر العائلي</span></li>\r\n<li><span style=\"color: #000000;\">&nbsp;أو مضمون ولادة أحد الأبناء</span></li>\r\n<li><span style=\"color: #000000;\">&nbsp;مضمون ولادة صادر عن ضابط الحالة المدنية الأجنبي(بالنسبة للمولودين خارج حدود الوطن)</span></li>\r\n</ol>\r\n<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">مكان إيداع المـف :</span></h5>\r\n<ol>\r\n<li><span style=\"color: #000000;\">قسم الحالة المدنية بالبلدية أو الدائرة البلدية</span></li>\r\n<li><span style=\"color: #000000;\">السفارة أو القنصلية بالنسبة للمولودين بالخارج</span></li>\r\n</ol>\r\n<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">مكان الحصول على الخدمة :</span></h5>\r\n<ol>\r\n<li><span style=\"color: #000000;\">قسم الحالة المدنية بالبلدية أو الدائرة البلدية</span></li>\r\n<li><span style=\"color: #000000;\">السفارة أو القنصلية بالنسبة للمولودين بالخارج</span></li>\r\n</ol>\r\n<h5><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">ملاحظات:</span></h5>\r\n<ol>\r\n<li><span style=\"color: #000000;\">الهدف من الإدلاء بالوثائق هو لتفادي الغلط وللحرص على تطابق كتابة ألقاب أفراد العائلة الواحدة.</span></li>\r\n<li><span style=\"color: #000000;\">يجب على العون المكلف بترسيم المولود أن يعيد قراءة بيانات الترسيم بصـــوت واضـــح للتثبت من مطابقة هذه البيانات للواقع.</span></li>\r\n<li><span style=\"color: #000000;\">يجب على القائم بالتصريح أن يمضي على نظيرين من دفتر ترسيم الولادات.</span></li>\r\n</ol>', NULL, '[]', NULL, NULL, NULL, 'naissance', 'PUBLISHED', 0, NULL, '2019-11-07 08:12:01', '2019-11-07 10:51:38', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(15, 'Le décès', 'الوفيات', NULL, '<h6><strong><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">Conditions d&rsquo;obtention de la prestation&nbsp;</span></strong></h6>\r\n<p><span style=\"color: #000000;\">Formulation d&rsquo;une demande orale ou par voie postale aupr&egrave;s de l\'officier d\'&eacute;tat civil :</span></p>\r\n<ul>\r\n<li><span style=\"color: #000000;\">- Paiement des redevances dues (paiement en esp&egrave;ce ou par mandatpostal) au nom de l\'officier d\'&eacute;tat civil avec une enveloppe timbr&eacute;e portant l\'adresse du requ&eacute;rant, si la demande est faite par voie postal.</span></li>\r\n</ul>\r\n<h6><strong><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">Documents &agrave; fournir</span></strong></h6>\r\n<p><span style=\"color: #000000;\">Fournir des renseignements relatifs &agrave; la date de d&eacute;c&egrave;s (num&eacute;ro, ann&eacute;e, jour et le lieu) ou un ancien extrait de d&eacute;c&egrave;s.</span></p>\r\n<h6><strong><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">D&eacute;lai</span></strong></h6>\r\n<p><span style=\"color: #000000;\">Imm&eacute;diatement!!</span></p>\r\n<h6><strong><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">R&eacute;f&eacute;rences l&eacute;gislatives ou r&eacute;glementaires</span></strong></h6>\r\n<ol>\r\n<li><span style=\"color: #000000;\">La circulaire du Premier Ministre n&deg;15 du 14 f&eacute;vrier 1989.</span></li>\r\n<li><span style=\"color: #000000;\">La circulaire du Premier Ministre n&deg;15 du 14 f&eacute;vrier 1989.</span></li>\r\n</ol>\r\n<h6><strong><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">Proc&eacute;dures de r&eacute;alisation de la prestation</span></strong></h6>\r\n<ol>\r\n<li><span style=\"color: #000000;\">Accueil du citoyen et r&eacute;ception des documents.</span></li>\r\n<li><span style=\"color: #000000;\">R&eacute;daction ou impression d&rsquo;un exemplaire de l&rsquo;extrait de d&eacute;c&egrave;s.</span></li>\r\n<li><span style=\"color: #000000;\">Paiement des droits dus par le citoyen.</span></li>\r\n<li><span style=\"color: #000000;\">Remise de l&rsquo;extrait au citoyen.</span></li>\r\n</ol>\r\n<h6><strong><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">Service prestataire</span></strong></h6>\r\n<p><span style=\"color: #000000;\">Service de l&rsquo;Etat Civil de la commune ou Arrondissement.</span></p>\r\n<h6><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\"><strong>Lieu du d&eacute;p&ocirc;t de la demande</strong> </span></h6>\r\n<p><span style=\"color: #000000;\">Service de l&rsquo;Etat Civil de la commune ou Arrondissement.</span></p>\r\n<h6><strong><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">Lieu du d&eacute;p&ocirc;t de la demande </span></strong></h6>\r\n<p><span style=\"color: #000000;\">Service de l&rsquo;Etat Civil de la commune ou Arrondissement.</span></p>\r\n<h6><strong><span style=\"font-family: Consolas, \'Lucida Console\', \'Courier New\', monospace; white-space: pre-wrap; color: #ff0000;\">Lieu d&rsquo;obtention de la prestation</span></strong></h6>\r\n<p><span style=\"color: #000000;\">Service de l&rsquo;Etat Civil de la commune ou Arrondissement.</span></p>', NULL, NULL, '[]', NULL, NULL, NULL, 'le-deces', 'PUBLISHED', 0, NULL, '2019-11-07 08:47:10', '2020-08-12 12:02:08', NULL, '1', '1', NULL, NULL, NULL, '[]'),
(16, 'Le mariage', 'الزواج', NULL, '<p><span style=\"color: #000000;\">Depuis la promulgation du code du statut personnel, le mariage ne peut plus &ecirc;tre dress&eacute; que sur un acte authentique de deux notaires ou d\'un officier d\'Etat Civil. Il est &eacute;galement exig&eacute; la pr&eacute;sence de 2 t&eacute;moins lors de la conclusion du contrat de mariage et l\'approbation du p&egrave;re et de la m&egrave;re pour les mineurs.</span></p>\r\n<h6><span style=\"color: #ff0000;\">Les Conditions</span></h6>\r\n<ol>\r\n<li><span style=\"color: #000000;\">Les deux &eacute;poux doivent &ecirc;tre de sexes diff&eacute;rents.</span></li>\r\n<li><span style=\"color: #000000;\">L\'acceptation des deux &eacute;poux, quelque soit leur &acirc;ge, et ce, devant l\'officier de l\'Etat civil ou devant les notaires.</span></li>\r\n<li><span style=\"color: #000000;\">Avoir l\'&acirc;ge l&eacute;gal de contracter mariage.</span></li>\r\n<li><span style=\"color: #000000;\">Une d&eacute;cision judiciaire si l\'&eacute;poux est &acirc;g&eacute; de moins de vingt ans et l\'&eacute;pouse de moins de 17 ans.</span></li>\r\n<li><span style=\"color: #000000;\">L\'approbation du tuteur pour l\'&eacute;poux &acirc;g&eacute; de moins de vingt ans.</span></li>\r\n<li><span style=\"color: #000000;\">Le tuteur est le plus proche agnat (p&egrave;re, oncle paternel, fr&egrave;re...).</span></li>\r\n<li><span style=\"color: #000000;\">Il doit &ecirc;tre de sexe masculin, sain d\'esprit et majeur.</span></li>\r\n<li><span style=\"color: #000000;\">Il est en premier lieu le p&egrave;re ou celui qu\'il mandate.</span></li>\r\n<li><span style=\"color: #000000;\">Les deux &eacute;poux ne doivent pas se trouver dans un des cas d\'emp&ecirc;chement au mariage ou d\'autres emp&ecirc;chements chor&eacute;iques.</span></li>\r\n</ol>\r\n<h6><span style=\"color: #ff0000;\">Les pi&egrave;ces constitutives du dossier de mariage</span></h6>\r\n<ol>\r\n<li><span style=\"color: #000000;\">Carte d\'identit&eacute; nationale des deux &eacute;poux.</span></li>\r\n<li><span style=\"color: #000000;\">Extrait de naissance pour chacun d\'entre eux, sur lequel figure la mention en vue du mariage.</span></li>\r\n<li><span style=\"color: #000000;\">certificat m&eacute;dical pr&eacute;nuptial.</span></li>\r\n<li><span style=\"color: #000000;\">Autorisation du juge pour l\'homme de moins de 20 ans et pour la femme de moins de 17 ans.</span></li>\r\n<li><span style=\"color: #000000;\">Accord, par acte authentique, du tuteur dans le cas o&ugrave; celui-ci serait absent lors de la conclusion du mariage de l\'un des deux &eacute;poux mineur ou des deux &agrave; la fois.</span></li>\r\n<li><span style=\"color: #000000;\">Extrait du d&eacute;c&egrave;s du conjoint pour les veufs et veuves.</span></li>\r\n<li><span style=\"color: #000000;\">Certificat de mention de divorce d&eacute;livr&eacute; par l\'officier d\'Etat Civil du lieu du mariage ou de naissance.</span></li>\r\n<li><span style=\"color: #000000;\">Carte d\'identit&eacute; nationale des deux t&eacute;moins.</span></li>\r\n<li><span style=\"color: #000000;\">Autorisation administrative si l\'un des &eacute;poux appartient au corps de la force de la s&eacute;curit&eacute; int&eacute;rieure (Garde Nationale, S&ucirc;ret&eacute; de Police, Prison et R&eacute;&eacute;ducation, Protection civile), &agrave; l\'arm&eacute;e, et la douane ou au corps diplomatique.</span></li>\r\n<li><span style=\"color: #000000;\">Une d&eacute;claration relative au r&eacute;gime de la communaut&eacute; des biens entre &eacute;poux.</span></li>\r\n</ol>\r\n<h6><span style=\"color: #ff0000;\">Le mariage des &eacute;trangers</span></h6>\r\n<p><span style=\"color: #000000;\">Lorsqu\'il s\'agit de mariage d\'&eacute;trangers, ils doivent produire un certificat de leur consul certifiant leur capacit&eacute; de contracter mariage et aussi qu\'ils ne sont pas encore li&eacute;s par un pr&eacute;c&eacute;dent mariage.</span></p>\r\n<p><span style=\"color: #000000;\">Etant donn&eacute; que la pratique de la polygamie est encore usit&eacute;e dans diff&eacute;rents pays, le certificat de divorce ou de d&eacute;c&egrave;s du conjoint n\'est pas suffisant.</span></p>', '<div id=\"accordion\" class=\"panel-group accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl; text-align: right;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseOne\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseOne\"> المراجع التشريعية و الترتيبية</a></h4>\r\n</div>\r\n<div id=\"collapseOne\" class=\"panel-collapse collapse\" style=\"height: 0px; text-align: right;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- الفصول من 15 إلى 32 من القانون عدد 3 لسنة 1957 المؤرخ في 1 أوت 1957 المتعلق بتنظيم الحالة المدنية كما تم إتمامه و تنقيحه بالنصوص اللاحقة</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- الأمر المؤرخ في 13 أوت 1956 المتعلق بإصدار مجلة الأحوال الشخصية كما تم إتمامه و تنقيحه بالنصوص اللاحقة .</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- القوانين الأساسية الخاصة بالأسلاك النشيطة وأعوان القمارق والجيش الوطني والأعوان الدبلوماسيين</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingTwo\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseTwo\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">شروط الانتفاع بالخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">-توفر كافة الشروط القانونية لدى الرجل والمرأة لإمكانية الزواج (بلوغ السن القانوني18 سنة أو ترخيص من المحكمة في خلاف ذلك) </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">-رضا الزوجين</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">-خلوهما من الموانع الشرعية بشهادة شاهدين من أهل الثقة </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- تسمية مهر الزوجة </span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingThree\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseThree\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseThree\">الوثائق المطلوبة</a></h4>\r\n</div>\r\n<div id=\"collapseThree\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingThree\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">تقديم ملف يحتوى على الوثائق التالية:</span>\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">مضمون ولادة لكل من الزوجين</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">شهادة طبية لإتمام الزواج</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">نسخة من بطاقة التعريف أو جواز سفر ساري المفعول تثبت هوية كل من الزوجين</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">إذن من المحكمة لمن هم دون السن القانوني</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">موافقة كتابية معرف بها من الولي في صورة عدم حضوره مراسم إبرام العقد وذلك بالنسبة للحالات التي يكون فيها أحد الزوجين أو كلاهما غير بالغ لسن الرشد القانوني</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">مضمون وفاة الزوج أو الزوجة بالنسبة للأرامل</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> مضمون ولادة منصوص به على الطلاق ( بالنسبة للمطلق أو المطلقة)</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">توكيل لإبرام عقد الزواج عند الاقتضاء</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">ترخيص من الإدارة بالنسبة للمنتمين إلى قوات الأمن الداخلي ( الشرطة الوطنية، وأعوان الحرس الوطني) وأعوان الحماية المدنية، و أعوان الديوانة والعسكريين وأعوان السلك الديبلوماسي</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">شهادة من القنصلية أو السفارة في إمكانية إبرام عقد الزواج بالنسبة للأجانب</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">شهادة في اعتناق الدين الإسلامي لغير المسلمين الراغبين في التزوج بتونسية مسلمة</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">شهادة في عدم الارتباط بأي علاقة زوجية بالنسبة للأجانب</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> الاستظهار ببطاقة التعريف بالنسبة للشاهدين(مع وجوب توفر الشروط القانونية لكلا الشاهدين)</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> تعميـر وإمضـاء وثيقـة اختيار نظام الاشتراك أوعدم الاشتراك في الأملاك بين الزوجين ( اختياري)</span></li>\r\n</ol>\r\n</li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">تقرير المصالح الأمنية إن كانت الموت في ظروف غير عادية تثير الشك </span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFour\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFour\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFour\"> مكــان إيـداع الملــف</a></h4>\r\n</div>\r\n<div id=\"collapseFour\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFour\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> قسم الحالة المدنية بالبلدية أو بالدائرة البلدية</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFive\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFive\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFive\">مكان الحصول على الخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseFive\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFive\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> قسم الحالة المدنية بالبلدية أو بالدائرة البلدية</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingSix\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSix\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSix\">أجل الحصول على الخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseSix\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingSix\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">فورا</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingSeven\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSeven\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSeven\"> ملاحظــــات</a></h4>\r\n</div>\r\n<div id=\"collapseSeven\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingSeven\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"text-align: right;\">يتوجب على الأطراف المعنية ( الزوجان أو من ينوبهما بمقتضى توكيل رسمي)&nbsp;</li>\r\n</ul>\r\n<p style=\"text-align: right;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;تقديم طلب إلى ضابط الحالة المدنية،&nbsp;</p>\r\n<p style=\"text-align: right;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;تقديم الوثائق اللازمة،&nbsp;</p>\r\n<p style=\"text-align: right;\">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;تعيين موعد لعقد الزواج،&nbsp;</p>\r\n<ul>\r\n<li style=\"text-align: right;\">يقوم كل من الشاهدين وضابط الحالة المدنية علاوة على الزوجين بالإمضاء على عقد الزواج.</li>\r\n</ul>\r\n<p dir=\"rtl\" style=\"font-weight: 300; text-align: right;\">&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'le-mariage', 'PUBLISHED', 0, NULL, '2019-11-07 09:27:17', '2020-08-12 12:00:58', NULL, '1', '1', NULL, NULL, NULL, '[]');
INSERT INTO `articles` (`id`, `titre_fr`, `titre_ar`, `titre_en`, `contenu_fr`, `contenu_ar`, `contenu_en`, `images`, `seo_title`, `meta_description`, `meta_keywords`, `slug`, `status`, `featured`, `deleted_at`, `created_at`, `updated_at`, `ListStatistiques`, `creerPar`, `modifierPar`, `approuverPar`, `approuverLe`, `depublierLe`, `fichiers`) VALUES
(17, 'Les extraits d\'état civil', 'رسم من الحالة المدنية', NULL, '<p><span style=\"color: #000000;\">L&rsquo;obtention de copie conforme &agrave; l&rsquo;acte ou la consultation directe du registre par des tiers pouvant causer un pr&eacute;judice moral au titulaire de l&rsquo;acte ou des ayants-droit, pour y pallier, le l&eacute;gislateur a d&eacute;fini les conditions d&rsquo;obtention des documents d&rsquo;Etat civil.</span></p>\r\n<h5><span style=\"color: #ff0000;\">Obtention des documents d&rsquo;Etat civil</span></h5>\r\n<p><span style=\"color: #000000;\">Il est possible d&rsquo;obtenir des copies de l&rsquo;acte ou des extraits de cet acte, selon la qualit&eacute; du demandeur.</span></p>\r\n<p><span style=\"color: #000000;\">Seul le titulaire de l&rsquo;acte, ses ascendants ou descendants en ligne directe, son conjoint ni divorc&eacute; ni s&eacute;par&eacute;, ou son tuteur, ou repr&eacute;sentant l&eacute;gal s\'il est mineur ou en &eacute;tat d\'incapacit&eacute;, ou le Procureur de la R&eacute;publique peuvent avoir une seule copie conforme ou un extrait des actes de l\'&eacute;tat civil (naissance, mariage, d&eacute;c&egrave;s). Une autorisation du juge est n&eacute;cessaire pour toute autre personne.</span></p>', NULL, NULL, '[]', NULL, NULL, NULL, 'les-extraits-d-etat-civil', 'PUBLISHED', 0, NULL, '2019-11-07 09:37:54', '2020-08-12 12:00:25', NULL, '1', '1', NULL, NULL, NULL, '[]'),
(18, 'Réctification des actes d’état civil', 'التنصيص على رسم من الحالة المدنية', NULL, '<p><span style=\"color: #000000;\">L&rsquo;officier d&rsquo;Etat civil ne peut rectifier un acte sauf sur autorisation du juge du tribunal de premi&egrave;re instance du lieu de r&eacute;daction de l&rsquo;acte. Pour les actes dress&eacute;s par les agents diplomatiques et les consuls, c&rsquo;est le tribunal de premi&egrave;re instance de Tunis qui est comp&eacute;tent.</span></p>\r\n<h6><span style=\"color: #ff0000;\"><strong>Proc&eacute;dure :</strong></span></h6>\r\n<p><span style=\"color: #000000;\">Le jugement de rectification est adress&eacute; par le procureur de la R&eacute;publique pr&egrave;s le tribunal &agrave; l&rsquo;officier de l&rsquo;Etat civil, pour que mention soit faite.</span></p>', NULL, NULL, '[]', NULL, NULL, NULL, 'rectification-des-actes-d-etat-civil', 'PUBLISHED', 0, NULL, '2019-11-07 09:39:52', '2019-11-08 08:52:01', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(19, 'Le livret de famille', 'الدفتر العائلي', NULL, '<p><span style=\"color: #000000;\">Il constitue pour le chef de famille le document auquel il se r&eacute;f&egrave;re toutes les fois qu&rsquo;il y a lieu de produire une pi&egrave;ce d&rsquo;&eacute;tat civil concernant chacun des membres de la famille.</span></p>\r\n<h6><span style=\"color: #ff0000;\"><strong>Qui le d&eacute;livre ?</strong></span></h6>\r\n<p><span style=\"color: #000000;\">L&rsquo;Officier de l&rsquo;&eacute;tat civil du lieu de mariage, pour ceux qui ont contract&eacute; mariage apr&egrave;s le 01/08/1957. L&rsquo;Officier de l&rsquo;&eacute;tat civil du lieu de naissance de l&rsquo;&eacute;poux, pour ceux qui ont contract&eacute; mariage avant la publication de la loi de l&rsquo;&eacute;tat civil.</span></p>\r\n<h6><span style=\"color: #ff0000;\"><strong>A qui le d&eacute;livre t-on ?</strong></span></h6>\r\n<ol>\r\n<li><span style=\"color: #000000;\">Au chef de famille.</span></li>\r\n<li><span style=\"color: #000000;\">A la divorc&eacute;e, si elle n&rsquo;est pas remari&eacute;e.</span></li>\r\n<li><span style=\"color: #000000;\">A la veuve qui doit le garder, sauf d&eacute;cision judiciaire contraire.</span></li>\r\n</ol>\r\n<h6><span style=\"color: #ff0000;\"><strong>Pi&egrave;ces N&eacute;cessaires</strong></span></h6>\r\n<ol>\r\n<li><span style=\"color: #000000;\">Photo du chef de famille.</span></li>\r\n<li><span style=\"color: #000000;\">Extrait de mariage.</span></li>\r\n<li><span style=\"color: #000000;\">Extrait de naissance du conjoint.</span></li>\r\n<li><span style=\"color: #000000;\">Extrait de naissance du reste de la famille, en cas d&rsquo;extrait d&rsquo;un duplicata.</span></li>\r\n<li><span style=\"color: #000000;\">Extrait de d&eacute;c&egrave;s, en cas de remise de carnet &agrave; la m&egrave;re.</span></li>\r\n<li><span style=\"color: #000000;\">Copie du jugement de divorce, pour la femme qui a la garde des enfants.</span></li>\r\n</ol>\r\n<h6><span style=\"color: #ff0000;\"><strong>Delai</strong></span></h6>\r\n<p><span style=\"color: #000000;\">Le livret de famille est d&eacute;livr&eacute; imm&eacute;diatement, si le mariage a &eacute;t&eacute; contract&eacute; &agrave; la mairie.</span></p>\r\n<h6><span style=\"color: #ff0000;\"><strong>Notes</strong></span></h6>\r\n<p><strong><span style=\"color: #000000;\">NB :</span></strong></p>\r\n<p><span style=\"color: #000000;\">Il n&rsquo;est permis &agrave; aucune personne autre que l&rsquo;officier de l&rsquo;&eacute;tat civil d&ucirc;ment habilit&eacute; de porter une observation ou une mention quelconque sur le livret de famille. Celui-ci n&rsquo;est d&eacute;livr&eacute; qu\'aux Tunisiens.</span></p>', '<div id=\"accordion\" class=\"panel-group accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl; text-align: right;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseOne\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseOne\"> المراجع التشريعية و الترتيبية:</a></h4>\r\n</div>\r\n<div id=\"collapseOne\" class=\"panel-collapse collapse\" style=\"height: 0px; text-align: right;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p dir=\"rtl\">&nbsp;- القانون عدد 28 لسنة 1967 المؤرخ في 30 جوان 1967 المتعلق بإحداث الدفتر العائلي كما تم إتمامه و تنقيحه بالنصوص اللاحقة</p>\r\n<p dir=\"rtl\">- منشور الوزير الأول عدد 15 المؤرخ في 14 فيفري 1989 المتعلق بتبسيط الإجراءات في خصوص وثائق الحالة المدنية.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingTwo\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseTwo\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">شروط الانتفاع بالخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p dir=\"rtl\"><strong>&nbsp;</strong>- أن يكون طالب الخدمة تونسيا ومتزوجا</p>\r\n<p dir=\"rtl\">- يخول طلب الدفتر العائلي من طرف : رئيس العائلة، المطلقة إذا لم تتزوج ثانية، الأرملة التي تبقي مؤتمنة عليه إذا لم يصدر حكم مخالف لذلك.</p>\r\n<p dir=\"rtl\">- يجب أن يكون عقد الزواج مبرما في دائرة مرجع النظر الترابي للبلدية سواء من طرف البلدية أو من عدول الإشهاد.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingThree\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseThree\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseThree\">الوثائق المطلوبة</a></h4>\r\n</div>\r\n<div id=\"collapseThree\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingThree\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p dir=\"rtl\">&nbsp;تقديم ملف يحتوى على الوثائق التالية :</p>\r\n<p dir=\"rtl\">&nbsp;- صورة شمسية لرئيس العائلة،</p>\r\n<p dir=\"rtl\">&nbsp;- نسخة من بطاقة التعريف الوطنية للزوج،</p>\r\n<p dir=\"rtl\">- مضمون زواج،</p>\r\n<p dir=\"rtl\">&nbsp;- مضمون ولادة لكل من الزوجين،</p>\r\n<p dir=\"rtl\">&nbsp;- مضامين لبقية أفراد العائلة (في حالة استخراج الدفتر بعد مدة من الزواج(،</p>\r\n<p dir=\"rtl\">&nbsp;- المعلوم الموظف على الدفتر العائلي،</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFour\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFour\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFour\"> مكــان إيـداع الملــف:</a></h4>\r\n</div>\r\n<div id=\"collapseFour\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFour\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p dir=\"rtl\">&nbsp;- قسم الحالة المدنية بالبلدية أو بالدائرة البلدية</p>\r\n<p dir=\"rtl\">&nbsp;-السفارة أو القنصلية</p>\r\n<p dir=\"rtl\">&nbsp;- المعتمدية خارج المناطق البلدية</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFive\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFive\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFive\">مكان الحصول على الخدمة :</a></h4>\r\n</div>\r\n<div id=\"collapseFive\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFive\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p dir=\"rtl\">&nbsp;- قسم الحالة المدنية بالبلدية أو بالدائرة البلدية</p>\r\n<p dir=\"rtl\">- السفارة أو القنصلية</p>\r\n<p dir=\"rtl\">&nbsp;- المعتمدية خارج المناطق البلدية</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingSix\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSix\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSix\">أجل الحصول على الخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseSix\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingSix\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p dir=\"rtl\">&nbsp;- يسلّم الدفتر العائلي حينيا بمناسبة عقد الزواج أو خلال أسبوع في غير ذلك من الحالات</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingSeven\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSeven\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSeven\"> ملاحظــــات:</a></h4>\r\n</div>\r\n<div id=\"collapseSeven\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingSeven\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p dir=\"rtl\">&nbsp;- عندما يكون مطلب استخراج دفتر عائلي متزامنا مع إبرام عقد الزواج أمام ضابط الحالة المدنية، يتم اعتماد نفس وثائق الحالة المدنية المعدة لإبرام عقد الزواج لإعداد الدفتر العائلي لأول مرة.</p>\r\n<p dir=\"rtl\">&nbsp;- كل ما يدرج بالدفتر العائلي لا يتم إلا من طرف ضابط الحالة المدنية المؤهل لذلك ولا يجوز لغيره إدخال أي تعديلات أ</p>\r\n<p dir=\"rtl\">&nbsp;<strong>ملاحظات على الدفتر العائلي</strong>.</p>\r\n<p dir=\"rtl\">&nbsp;- في صورة وفاة رئيس العائلة المحتفظ بالدفتر العائلي أو صدور حكم بتجريده من حقوقه المدنية يرجع حق الاحتفاظ بالدفتر للزوجة ما لم يصدر حكم يناقض ذلك.</p>\r\n<p dir=\"rtl\">&nbsp;- وثائق الحالة المدنية المستخرجة من الدفتر العائلي لها \"قانونا \" نفس قوة الإثبات التي للوثائق المستخرجة من الدفتر الأصلي.</p>\r\n<p dir=\"rtl\">&nbsp;- يعاقب بالسجن مدة سنة وبخطية قدرها 240 دينارا كل من يتعمد استعمال وثائق محررة بمقتضي دفترعائلي يتضمن إرشادات ناقصة أو غير صحيحة.</p>\r\n<p dir=\"rtl\">- بالنسبة للمتزوجين قبل قانون الحالة المدنية الصادر خلال سنة 1957 يسلم لهم الدفتر العائلي من مكان ولادة الزوج.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'le-livret-de-famille', 'PUBLISHED', 0, NULL, '2019-11-07 09:51:51', '2019-11-08 09:01:02', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(20, 'Rectification d\'extrait de naissance', 'إصلاح رسم ولادة', NULL, NULL, '<div id=\"accordion\" class=\"panel-group accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseOne\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseOne\"> المراجع التشريعية و الترتيبية:</a></h4>\r\n</div>\r\n<div id=\"collapseOne\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li><span style=\"color: #000000;\">القانون عدد 3 لسنة 1957 المؤرخ في 1 أوت 1957المنشور المتعلق بتنظيم الحالة المدنية كما تم إتمامه و تنقيحه بالنصوص اللاحقة.</span></li>\r\n<li><span style=\"color: #000000;\">القانون عدد 59-130 المؤرخ في 5 أكتوبر 1959 المتعلــق بإصدار مجلـة المرافعـــات المدنية والتجارية كما تم إتمامه و تنقيحه بالنصوص اللاحقة</span></li>\r\n<li><span style=\"color: #000000;\">المشترك بين وزيري العدل والداخلية تحت عدد 45 بتاريخ 29 سبتمبر 1984</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingTwo\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseTwo\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseTwo\"> شروط الانتفاع بالخدمة </a></h4>\r\n</div>\r\n<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li><span style=\"color: #000000;\">-القانون عدد 3 لسنة 1957 المؤرخ في 1 أوت 1957 المتعلق بتنظيم الحالة المدنية كما تم إتمامه و تنقيحه بالنصوص اللاحقة.</span></li>\r\n<li><span style=\"color: #000000;\">-القانون عدد 59-130 المؤرخ في 5 أكتوبر 1959 المتعلــق بإصدار مجلـة المرافعـــات المدنية والتجارية كما تم إتمامه و تنقيحه بالنصوص اللاحقة</span></li>\r\n<li><span style=\"color: #000000;\">- المنشور المشترك بين وزيري العدل والداخلية تحت عدد 45 بتاريخ 29 سبتمبر 1984</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingThree\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseThree\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseThree\"> الوثائق المطلوبة</a></h4>\r\n</div>\r\n<div id=\"collapseThree\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingThree\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li><span style=\"color: #000000;\">-القانون عدد 3 لسنة 1957 المؤرخ في 1 أوت 1957 المتعلق بتنظيم الحالة المدنية كما تم إتمامه و تنقيحه بالنصوص اللاحقة.</span></li>\r\n<li><span style=\"color: #000000;\">-القانون عدد 59-130 المؤرخ في 5 أكتوبر 1959 المتعلــق بإصدار مجلـة المرافعـــات المدنية والتجارية كما تم إتمامه و تنقيحه بالنصوص اللاحقة</span></li>\r\n<li><span style=\"color: #000000;\">- المنشور المشترك بين وزيري العدل والداخلية تحت عدد 45 بتاريخ 29 سبتمبر 1984</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFour\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFour\"> مكـــــان إيــــداع الملــــف:</a></h4>\r\n</div>\r\n<div id=\"collapseFour\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li><span style=\"color: #000000;\"> -قسم الحالة المدنية بالبلدية أو بالدائرة البلدية</span></li>\r\n<li><span style=\"color: #000000;\">-مكان الحصول على الخدمة</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFive\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFive\"> مكان الحصول على الخدمة :</a></h4>\r\n</div>\r\n<div id=\"collapseFive\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li><span style=\"color: #000000;\"> قسم الحالة المدنية بالبلدية أو بالدائرة البلدية</span></li>\r\n<li><span style=\"color: #000000;\">المعتمديــــة خــــارج المنطقــــة البلديـــــة </span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSix\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSix\"> أجل الحصول على الخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseSix\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li><span style=\"color: #000000;\"> -خلال شهرين من تسليم المطلب</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'rectification-d-extrait-de-naissance', 'PUBLISHED', 0, NULL, '2019-11-07 10:56:58', '2019-11-12 10:57:34', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(21, 'Prestation de mort', 'مضمون الوفاة', NULL, NULL, '<div id=\"accordion\" class=\"panel-group accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl; text-align: right;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseOne\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseOne\"> المراجع التشريعية و الترتيبية:</a></h4>\r\n</div>\r\n<div id=\"collapseOne\" class=\"panel-collapse collapse\" style=\"height: 0px; text-align: right;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">القانون عدد 3 لسنة 1957 المؤرخ في 1 أوت 1957المنشور المتعلق بتنظيم الحالة المدنية كما تم إتمامه و تنقيحه بالنصوص اللاحقة.</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">القانون عدد 59-130 المؤرخ في 5 أكتوبر 1959 المتعلــق بإصدار مجلـة المرافعـــات المدنية والتجارية كما تم إتمامه و تنقيحه بالنصوص اللاحقة</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">المشترك بين وزيري العدل والداخلية تحت عدد 45 بتاريخ 29 سبتمبر 1984</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingTwo\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseTwo\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">الوثائق المطلوبة </a></h4>\r\n</div>\r\n<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- الإدلاء بالمعلومات التي تخص الوفاة (عدد، سنة، اليوم و المكان)</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingThree\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseThree\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseThree\">أجل الحصول على الخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseThree\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingThree\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">فورا!!</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFour\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFour\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFour\"> المراجع التشريعية و الترتيبية</a></h4>\r\n</div>\r\n<div id=\"collapseFour\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFour\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> - القانون عدد 3 لسنة 1957 المؤرخ في 1 أوت 1957 المتعلق بتنظيم الحالة المدنية.</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- منشور الوزير الأول عدد 15 المؤرخ في 14 فيفري 1989 المتعلق بتبسيط الإجراءات في خصوص وثائق الحالة المدنية.</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFive\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFive\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFive\">إجراءات إنجاز الخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseFive\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFive\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> - استلام الوثائق</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- إعداد أو طباعة نظير من مضمون الوفاة</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- خلاص المعلوم الموظف على الخدمة</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- تسليم مضون الوفاة</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingSix\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSix\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSix\"> المصلحة المسداة للخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseSix\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingSix\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> قسم الحالة المدنية بالبلدية أو الدائرة البلدية </span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingSeven\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSeven\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSeven\"> مكان إيداع الملف</a></h4>\r\n</div>\r\n<div id=\"collapseSeven\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingSeven\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> قسم الحالة المدنية بالبلدية أو الدائرة البلدية </span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"heading8\" class=\"panel-heading\" style=\"text-align: right;\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapse8\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapse8\">مكان الحصول على الخدمة</a></h4>\r\n</div>\r\n<div id=\"collapse8\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"heading8\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl; text-align: right;\"><span style=\"color: #000000;\"> قسم الحالة المدنية بالبلدية أو الدائرة البلدية </span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'prestation-de-mort', 'PUBLISHED', 0, NULL, '2019-11-07 13:35:11', '2019-11-07 13:58:30', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(22, 'Permission d\'inhumation', 'إذن بالدفن', NULL, NULL, '<div id=\"accordion\" class=\"panel-group accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl; text-align: right;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseOne\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseOne\"> المراجع التشريعية و الترتيبية:</a></h4>\r\n</div>\r\n<div id=\"collapseOne\" class=\"panel-collapse collapse\" style=\"height: 0px; text-align: right;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">الفصول 44 و 45 و 48 من القانون عدد 3 لسنة 1957 المؤرخ في 1 أوت 1957 المتعلق بتنظيم الحالة المدنية كما تم إتمامه و تنقيحه بالنصوص اللاحقة</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">الفصل 76 من القانون الأساسي للبلديات عدد 33 المؤرخ في 14 ماي 1975 كما تم إتمامه وتنقيحه بالنصوص اللاحقة </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">القانون عدد 12 لسنة 1997 المؤرخ في 25 فيفري 1997 حول المقابر و أماكن الدفن </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">الأمر عدد 1326 لسنة 1997 المؤرخ في 7 جويلية 1997 المتعلق بكيفية إعداد القبور وبضبط تراتيب الدفن و تراتيب إخراج الرفات أو الجثث. </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">منشور صادر عن وزارة الداخلية تحت عدد 86 مؤرخ في 3 نوفمبر 1997</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingTwo\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseTwo\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">شروط الانتفاع بالخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">إثر الوفاة وقبل القيام بالدفن</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingThree\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseThree\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseThree\">الوثائق المطلوبة</a></h4>\r\n</div>\r\n<div id=\"collapseThree\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingThree\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">شهادة طبية تفيد أن الموت تمت في ظروف طبيعية، </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">إذن من وكيل الجمهورية إذا كانت الموت تمت في ظروف غير عادية أو غامضة، </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">تقرير المصالح الأمنية في حالة الموت غير الطبيعية،</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">المعلوم الموظف على الوثيقة المطلوبة. </span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFour\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFour\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFour\"> مكــان إيـداع الملــف:</a></h4>\r\n</div>\r\n<div id=\"collapseFour\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFour\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> قسم الحالة المدنية بالبلدية أو بالدائرة البلدية </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">-المعتمدية خارج المنطقة البلدية </span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFive\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFive\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFive\">مكان الحصول على الخدمة :</a></h4>\r\n</div>\r\n<div id=\"collapseFive\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFive\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">قسم الحالة المدنية بالبلدية أو بالدائرة البلدية </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">المعتمديــــة خــــارج المنطقــــة البلديـــــة </span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingSix\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSix\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSix\">أجل الحصول على الخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseSix\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingSix\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">فورا</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingSeven\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSeven\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSeven\"> ملاحظــــات:</a></h4>\r\n</div>\r\n<div id=\"collapseSeven\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingSeven\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> إذا كانت الموت مشبوها فيها أو ناتجة عن عنف أو حادث أو في أي ظرف من الظروف الأخرى غير الطبيعية فإن الإذن بالدفن لا يسلم إلا على ضوء المحضر المحرر من طرف مصالح الأمن الوطني.</span></li>\r\n<li><span style=\"color: #000000;\"> في صورة نقل جثة من مكان لآخر يتولى ضابط الحالة المدنية الذي سيقبل الجثة بمقر جهته إعداد الإذن بالدفن استنادا على الوثائق المصاحبة للجثة (شهادة طبية ومضمون الوفاة) دون زيادة البحث عن أسباب الوفاة.</span></li>\r\n<li><span style=\"color: #000000;\"> كل شخص يدفن ميتّا دون إذن بالدفن يعاقب بالسجن و الخطية.</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'permission-d-inhumation', 'PUBLISHED', 0, NULL, '2019-11-07 14:12:14', '2019-11-07 14:20:37', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(23, 'Délimitation de la mort', 'ترسيم وفاة', NULL, NULL, '<div id=\"accordion\" class=\"panel-group accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl; text-align: right;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseOne\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseOne\"> المراجع التشريعية و الترتيبية</a></h4>\r\n</div>\r\n<div id=\"collapseOne\" class=\"panel-collapse collapse\" style=\"height: 0px; text-align: right;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- الفصول من 15 إلى 32 من القانون عدد 3 لسنة 1957 المؤرخ في 1 أوت 1957 المتعلق بتنظيم الحالة المدنية كما تم إتمامه و تنقيحه بالنصوص اللاحقة</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- الأمر المؤرخ في 13 أوت 1956 المتعلق بإصدار مجلة الأحوال الشخصية كما تم إتمامه و تنقيحه بالنصوص اللاحقة .</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- القوانين الأساسية الخاصة بالأسلاك النشيطة وأعوان القمارق والجيش الوطني والأعوان الدبلوماسيين</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingTwo\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseTwo\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">شروط الانتفاع بالخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">التصريح بالوفاة لدى ضابط الحالة المدنية لمكان الوفاة أو مكان اكتشاف الجثة إذا كان مكان الوفاة مجهولا. </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">يجب التصريح بالوفاة في ظرف 3 أيام من حصولها. </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">يتم التصريح بالوفاة من الأطراف التالي ذكرها :</span>\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- أحد الأقارب أو ممن لديه معلومات صحيحة وكاملة قدر الإمكان، </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- مديــر المستشفى أو المستوصف مكـــان حصول الوفــــاة على أن يكون ذلك في ظرف 24 ساعة من حصول الوفاة. </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- آمر السجن إذ كانت الوفاة حاصلة في السجن أو بتنفيذ حكم الإعدام. </span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">- الحرس أو الأمن الوطني إذا كانت الوفاة ناتجة عن حادث مرور أو أعمال عنف. </span></li>\r\n</ol>\r\n</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingThree\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseThree\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseThree\">الوثائق المطلوبة</a></h4>\r\n</div>\r\n<div id=\"collapseThree\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingThree\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">أكثر ما يمكن من معلومات عن المتوفي (وإن أمكن مضمون ولادته أو بطاقة تعريفه)</span></li>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">تقرير المصالح الأمنية إن كانت الموت في ظروف غير عادية تثير الشك </span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFour\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFour\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFour\"> مكــان إيـداع الملــف</a></h4>\r\n</div>\r\n<div id=\"collapseFour\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFour\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> قسم الحالة المدنية بالبلدية أو بالدائرة البلدية مكان حصول الوفاة</span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFive\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFive\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFive\">مكان الحصول على الخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseFive\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFive\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">قسم الحالة المدنية بالبلدية أو بالدائرة البلدية مكان حصول الوفاة</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingSix\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSix\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSix\">أجل الحصول على الخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseSix\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingSix\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\">فورا</span></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingSeven\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSeven\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSeven\"> ملاحظــــات</a></h4>\r\n</div>\r\n<div id=\"collapseSeven\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingSeven\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li style=\"direction: rtl;\"><span style=\"color: #000000;\"> بعد فوات الأجل القانوني ( 3 أيام ) لا يمكن الترسيم إلا بإذن من المحكمة الابتدائية التي بدائرتها حصلت الوفاة. </span></li>\r\n<li><span style=\"color: #000000;\"> الاكتفاء بالإعلام الوارد من المستشفى حتى لا يتم ترسيم الوفاة ثانية </span></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'delimitation-de-la-mort', 'PUBLISHED', 0, NULL, '2019-11-07 14:22:36', '2019-11-08 08:31:00', NULL, '1', NULL, NULL, NULL, NULL, '[]');
INSERT INTO `articles` (`id`, `titre_fr`, `titre_ar`, `titre_en`, `contenu_fr`, `contenu_ar`, `contenu_en`, `images`, `seo_title`, `meta_description`, `meta_keywords`, `slug`, `status`, `featured`, `deleted_at`, `created_at`, `updated_at`, `ListStatistiques`, `creerPar`, `modifierPar`, `approuverPar`, `approuverLe`, `depublierLe`, `fichiers`) VALUES
(24, 'Fiscalité Locale', 'الجباية المحلّية', NULL, NULL, '<div id=\"accordion\" class=\"panel-group accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl; text-align: right;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseOne\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseOne\"> المراجع القانونية</a></h4>\r\n</div>\r\n<div id=\"collapseOne\" class=\"panel-collapse collapse\" style=\"height: 0px; text-align: right;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul style=\"text-align: right;\">\r\n<li>قانون عدد 11 لسنة 1997 مؤرخ في 03 فيفري 1997 كما وقع تنقيحه واتمامه بالنصوص اللاحقة.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingTwo\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseTwo\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">المعلوم على العقارات المبنية</a></h4>\r\n</div>\r\n<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p style=\"text-align: right;\"><strong>التعريف</strong><br />تخضع العقارات المبنية الكائنة بالمنطقة البلدية لمعلوم سنوي يسمى \"المعلوم على العقارات المبنية\".</p>\r\n<p style=\"text-align: right;\"><strong>آجـــــــــال الدفـــــــــع</strong><br />في غرة جانفي من كل سنة.</p>\r\n<p style=\"text-align: right;\"><strong>يستوجب دفع المعلوم على</strong><strong>:</strong><br />- مالك العقار<br />- المنتفع به</p>\r\n<p style=\"text-align: right;\">في صورة غياب المذكورين أعلاه يستوجب المعلوم على حائز العقار أو شاغله</p>\r\n<p style=\"text-align: right;\"><strong>أساس المعلوم ونسبه</strong><strong>:</strong><br />يوظف المعلوم على العقارات المبنية على أساس 2% من الثمن المرجعي للمتر المربع لكل عقار تضرب في المساحة المغطاة للعقار. بين الأمر عدد 1185 المؤرخ في: 14-05-2007 الحد الأدنى والحد الأقصى للثمن المرجعي للمتر المربع المبني لكل صنف من أصناف العقارات على النحو التالي:</p>\r\n<table style=\"height: 279px; border-color: #000000; width: 790px; float: right;\" border=\"1\" width=\"790\">\r\n<tbody>\r\n<tr>\r\n<td width=\"24%\">\r\n<p><strong>الثمن المرجعي</strong></p>\r\n<p><strong>للمتر المربع (بالدينار</strong><strong>(</strong></p>\r\n</td>\r\n<td width=\"57%\">\r\n<p><strong>المساحة المغطاة</strong></p>\r\n</td>\r\n<td width=\"16%\">\r\n<p><strong>صنف العقار</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"24%\">\r\n<p>من 100 إلى 162</p>\r\n</td>\r\n<td width=\"57%\">\r\n<p>ويشمل العقارات التي لا تتعدى مساحتها المغطاة 100 م2.</p>\r\n</td>\r\n<td width=\"16%\">\r\n<p>الصنف 1:</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"24%\">\r\n<p>من 163 إلى 216</p>\r\n</td>\r\n<td width=\"57%\">\r\n<p>ويشمل العقارات التي تفوق مساحتها المغطاة 100 م2 ولا تتعدى 200 م2.</p>\r\n</td>\r\n<td width=\"16%\">\r\n<p>الصنف 2:</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"24%\">\r\n<p>من 217 إلى 270</p>\r\n</td>\r\n<td width=\"57%\">\r\n<p>ويشمل العقارات التي تفوق مساحتها المغطاة 200 م2 ولا تتعدى 400 م2.</p>\r\n</td>\r\n<td width=\"16%\">\r\n<p>الصنف 3:</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"24%\">\r\n<p>من 271 إلى 324</p>\r\n</td>\r\n<td width=\"57%\">\r\n<p>عقار تفوق مساحته المغطاة 500 متر مربع معد لتعاطي نشاط صناعي</p>\r\n</td>\r\n<td width=\"16%\">\r\n<p>الصنف 4:</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: right;\"><strong>الثمــــــــــــن</strong><br />حددت نسبة المعلوم على العقارات المبنية على أساس مستوى الخدمات المسداة من قبل البلدية: مثل التنظيف، التنوير العمومي، تبليط الأرصفة ،تعبيد الطرقات، وجود قنوات تصريف المياه المستعملة وقنوات تصريف مياه الأمطار، خدمات أخرى ...<br />وهي تتفاوت بحسب الخدمات المنتفع بها:</p>\r\n<table style=\"border-color: #000000; float: right;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td width=\"205\">\r\n<p><strong>النسبة</strong></p>\r\n</td>\r\n<td width=\"388\">\r\n<p><strong>الخدمات المنتفع بها</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"205\">\r\n<p>8 %</p>\r\n</td>\r\n<td width=\"388\">\r\n<p>بالنسبة للعقارات المنتفعة بخدمة أو خدمتين</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"205\">\r\n<p>10 %</p>\r\n</td>\r\n<td width=\"388\">\r\n<p>بالنسبة للعقارات المنتفعة بثلاث أو أربع خدمات</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"205\">\r\n<p>12 %</p>\r\n</td>\r\n<td width=\"388\">\r\n<p>بالنسبة للعقارات المنتفعة باكثر من أربع خدمات</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"205\">\r\n<p>14 %</p>\r\n</td>\r\n<td width=\"388\">\r\n<p>بالنسبة للعقارات المنتفعة باكثر من أربع خدمات و خدمات اخرى</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingThree\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseThree\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseThree\">المعلوم على الأراضي غير المبنية</a></h4>\r\n</div>\r\n<div id=\"collapseThree\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingThree\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p style=\"text-align: right;\"><strong>التعريف</strong><br />تخضع الأراضي غير المبنية الكائنة بالمنطقة البلدية لمعلوم سنوي يسمى \"المعلوم على الأراضي غير المبنية\".</p>\r\n<p style=\"text-align: right;\"><strong>آجال الدفع</strong><br />في غرة جانفي من كل سنة</p>\r\n<p style=\"text-align: right;\"><strong>يستوجب دفع المعلوم على</strong><strong>:</strong><br />مالك الارض<br />المنتفع بها<br />و في صورة غياب مالك أو منتفع معروف يستوجب المعلوم من طرف حائز العقار أو شاغله .</p>\r\n<p style=\"text-align: right;\"><strong>أساس المعلوم ونسبته</strong><br />يوظف المعلوم بنسبة 0,3 % على القيمة التجارية الحقيقية للأراضي.<br />وفي غياب القيمة التجارية المشار إليها بالفقرة الأولى من هذا الفصل يوظف معلوم بالمتر المربع تصاعديا حسب كثافة المناطق العمرانية المحددة بمثال التهيئة العمرانية يضبط بالنسبة لكل منطقة كل ثلاث سنوات بمقتضى أمر (عدد 1186 مؤرخ في 14-05-2007(</p>\r\n<p style=\"text-align: right;\">&nbsp;</p>\r\n<p style=\"text-align: right;\">&nbsp;</p>\r\n<table style=\"border-color: #000000; float: right;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td width=\"262\">\r\n<p><strong>المعلوم على المتر المربع( بالدينار</strong>&nbsp;<strong>(</strong></p>\r\n</td>\r\n<td width=\"246\">\r\n<p><strong>المنطقة</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"262\">\r\n<p>0,318</p>\r\n</td>\r\n<td width=\"246\">\r\n<p>منطقة ذات كثافة عمرانية مرتفعة</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"262\">\r\n<p>0,095</p>\r\n</td>\r\n<td width=\"246\">\r\n<p>منطقة ذات كثافة عمرانية متوسطة</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"262\">\r\n<p>0,032</p>\r\n</td>\r\n<td width=\"246\">\r\n<p>منطقة ذات كثافة عمرانية منخفضة</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFour\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFour\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFour\"> المعلوم على المؤسسات ذات الصبغة الصناعية أو التجارية أو المهنية</a></h4>\r\n</div>\r\n<div id=\"collapseFour\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFour\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p style=\"text-align: right;\"><strong>ميدان تطبيق المعلوم&nbsp;</strong><br />يستوجب دفع المعلوم على المؤسسات ذات الصبغة الصناعية أو التجارية أو المهنية على<br />الأشخاص الطبيعيين الخاضعين للضريبة على الدخل بعنوان الأرباح الصناعية والتجارية وأرباح المهن غير التجارية<br />الاشخاص المعنيين الخاضعين للضريبة على الشركات<br />شركات الأشخاص وشركات المحاصة التي تتعاطى نشاطا تجاريا أو مهنة غير تجارية</p>\r\n<p style=\"text-align: right;\"><strong>المؤسسات المعفاة من الأداء</strong><br />يعفى من المعلوم:<br />المؤسسات السياحية الخاضعة للمعلوم على النزل.<br />المؤسسات المنتفعة بنظام خاص بمقتضى نصوص تشريعية خاصة أو بمقتضى اتفاقيات خاصة خاضعة للأحكام الواردة بها.</p>\r\n<p style=\"text-align: right;\"><strong>أساس احتساب المعلوم</strong><br />يحسب المعلوم على المؤسسات ذات الصبغة الصناعية أو التجارية أو المهنية على أساس رقم المعاملات المحلي الخام المحقق من طرف المؤسسات الخاضعة للمعلوم .<br />يحسب المعلوم على أساس الضريبة على الدخل بالنسبة للأشخاص الطبيعيين الخاضعين للضريبة على الدخل بعنوان الأرباح أو الضريبة على الشركات.<br />المؤسسات التي لايتعدى هامش ربحها الخام 4% بموجب نص توثيقي.</p>\r\n<p style=\"text-align: right;\"><strong>نسب المعلوم</strong><br />حددت نسبة المعلوم على المؤسسات ذات الصبغة الصناعية او التجارية او المهنية بـ&nbsp; 0.2 بالمائة.<br />غير أن هذه النسبة تحدد بـ25% بالنسبة للضريبة على الدخل او للضريبة على شركات</p>\r\n<p style=\"text-align: right;\">&nbsp;</p>\r\n<p style=\"text-align: right;\">&nbsp;</p>\r\n<p style=\"text-align: right;\"><strong>للتأكيـــــد</strong><br />لا يقل المعلوم على المؤسسات عن المعلوم على العقارات المبنية المستوجب بعنوان العقارات المستغلة في نطاق نشاط المؤسسة يحتسب على اساس &nbsp;5% من الثمن المرجعي للمتر المربع المبني لكل صنف من أصناف العقارات تضرب في المساحة المغطاة.</p>\r\n<p style=\"text-align: right;\">وقد حدد الأمر عدد 1187 المؤرخ في 14-05-2007 الحد الأدنى للمعلوم على المؤسسات لكل صنف من أصناف العقارات حسب نسب المعلوم على العقارات المبنية على النحو التالي:</p>\r\n<table style=\"height: 301px; border-color: #000000; width: 790px; float: right;\" border=\"1\" width=\"790\">\r\n<tbody>\r\n<tr style=\"height: 45px;\">\r\n<td style=\"height: 45px; width: 449px;\" colspan=\"4\">\r\n<p><strong>المعلوم بالمتر المربع المرجعي (بالدينار</strong><strong>(</strong></p>\r\n</td>\r\n<td style=\"height: 91px; width: 216px;\" rowspan=\"2\">\r\n<p><strong>خصوصية العقار</strong></p>\r\n<p><strong>&nbsp;</strong></p>\r\n</td>\r\n<td style=\"height: 91px; width: 103px;\" rowspan=\"2\">\r\n<p><strong>صنف العقار</strong></p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 46px;\">\r\n<td style=\"height: 46px; width: 93px;\">\r\n<p>نسبة 14%</p>\r\n</td>\r\n<td style=\"height: 46px; width: 93px;\">\r\n<p>نسبة 12%</p>\r\n</td>\r\n<td style=\"height: 46px; width: 102px;\">\r\n<p>نسبة 10%</p>\r\n</td>\r\n<td style=\"height: 46px; width: 143px;\">\r\n<p>نسبة 8%</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 59px;\">\r\n<td style=\"height: 59px; width: 93px;\">\r\n<p>1,425</p>\r\n</td>\r\n<td style=\"height: 59px; width: 93px;\">\r\n<p>1,220</p>\r\n</td>\r\n<td style=\"height: 59px; width: 102px;\">\r\n<p>1,020</p>\r\n</td>\r\n<td style=\"height: 59px; width: 143px;\">\r\n<p>0,815</p>\r\n</td>\r\n<td style=\"height: 59px; width: 216px;\">\r\n<p>عقار معد لإستعمال اداري أو لتعاطي نشاط تجاري أو غير تجاري</p>\r\n</td>\r\n<td style=\"height: 59px; width: 103px;\">\r\n<p>الصنف 1:</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 46px;\">\r\n<td style=\"height: 46px; width: 93px;\">\r\n<p>0,975</p>\r\n</td>\r\n<td style=\"height: 46px; width: 93px;\">\r\n<p>0,835</p>\r\n</td>\r\n<td style=\"height: 46px; width: 102px;\">\r\n<p>0,700</p>\r\n</td>\r\n<td style=\"height: 46px; width: 143px;\">\r\n<p>0,560</p>\r\n</td>\r\n<td style=\"height: 46px; width: 216px;\">\r\n<p>عقار ذو متانة خفيفة معد لتعاطي نشاط صناعي</p>\r\n</td>\r\n<td style=\"height: 46px; width: 103px;\">\r\n<p>الصنف 2:</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 46px;\">\r\n<td style=\"height: 46px; width: 93px;\">\r\n<p>1,200</p>\r\n</td>\r\n<td style=\"height: 46px; width: 93px;\">\r\n<p>1,030</p>\r\n</td>\r\n<td style=\"height: 46px; width: 102px;\">\r\n<p>0,860</p>\r\n</td>\r\n<td style=\"height: 46px; width: 143px;\">\r\n<p>0,685</p>\r\n</td>\r\n<td style=\"height: 46px; width: 216px;\">\r\n<p>عقار متين معد لتعاطي نشاط صناعي</p>\r\n</td>\r\n<td style=\"height: 46px; width: 103px;\">\r\n<p>الصنف 3:</p>\r\n</td>\r\n</tr>\r\n<tr style=\"height: 59px;\">\r\n<td style=\"height: 59px; width: 93px;\">\r\n<p>1,575</p>\r\n</td>\r\n<td style=\"height: 59px; width: 93px;\">\r\n<p>1,350</p>\r\n</td>\r\n<td style=\"height: 59px; width: 102px;\">\r\n<p>1,125</p>\r\n</td>\r\n<td style=\"height: 59px; width: 143px;\">\r\n<p>0,900</p>\r\n</td>\r\n<td style=\"height: 59px; width: 216px;\">\r\n<p>عقار تفوق مساحته المغطاة 5000 متر مربع معد لتعاطي نشاط صناعي</p>\r\n</td>\r\n<td style=\"height: 59px; width: 103px;\">\r\n<p>الصنف 4:</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFive\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFive\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFive\">المعلوم على النزل</a></h4>\r\n</div>\r\n<div id=\"collapseFive\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFive\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p dir=\"RTL\">يستوجب المعلوم على النزل على مستغلي المؤسسات السياحية كما وقع تعريفها بالتشريع الجاري به العمل.</p>\r\n<p dir=\"RTL\"><strong>أساس احتساب المعلوم</strong><br />يحتسب المعلوم على النزل على أساس رقم المعاملات الجملي الخام المحقق.</p>\r\n<p dir=\"RTL\"><strong>نسبة المعلوم</strong><br />حددت نسبة المعلوم على النزل بــ: 2%&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingSix\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSix\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSix\">معلوم الإجازة على بيع المشروبات</a></h4>\r\n</div>\r\n<div id=\"collapseSix\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingSix\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p style=\"text-align: right;\">يستوجب المعلوم على مستغلي المقاهي والحانات وقاعات الشاي.</p>\r\n<p style=\"text-align: right;\">وقد ضبط الأمر عدد 434 لسنة 1997 المؤرخ في 03 مارس 1997 التعريفة السنوية لمعلوم الإجازة الموظف على محلات بيع المشروبات كما يلي.</p>\r\n<table style=\"border-color: #000000; width: 71%; float: right;\" border=\"1\" width=\"71%\">\r\n<tbody>\r\n<tr>\r\n<td width=\"38%\">\r\n<p><strong>التعريفة بالدينار</strong></p>\r\n</td>\r\n<td width=\"60%\">\r\n<p><strong>صنف المحل</strong></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"38%\">\r\n<p>25</p>\r\n</td>\r\n<td width=\"60%\">\r\n<p>محلات من الصنف الأول</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"38%\">\r\n<p>150</p>\r\n</td>\r\n<td width=\"60%\">\r\n<p>محلات من الصنف الثاني</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"38%\">\r\n<p>300</p>\r\n</td>\r\n<td width=\"60%\">\r\n<p>محلات من الصنف الثالث</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br /><br /><br /><br /><br /><br /><br /><br />\r\n<p>يستخلص المعلوم خلال شهر جانفي من كل سنة ويستوجب المعلوم على السنة كاملة مهما كان التاريخ الذي بدأ أو انتهى فيه النشاط.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'fiscalite-locale', 'PUBLISHED', 0, NULL, '2019-11-08 09:01:56', '2019-11-08 09:23:19', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(25, 'Copies d\'état civil', 'نسخ من رسم الحالة المدنية', NULL, NULL, NULL, NULL, '[]', NULL, NULL, NULL, 'copies-d-etat-civil', 'PUBLISHED', 0, NULL, '2019-11-08 09:03:03', '2019-11-08 09:03:03', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(26, 'Etablir l\'état civil', 'التنصيص على رسم من الحالة المدنية', NULL, NULL, NULL, NULL, '[]', NULL, NULL, NULL, 'etablir-l-etat-civil', 'PUBLISHED', 0, NULL, '2019-11-08 09:03:46', '2019-11-08 09:03:46', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(27, 'Dossier de Permis de bâtir', 'ملف رخصة بناء', NULL, NULL, '<div id=\"accordion\" class=\"panel-group accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseOne\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseOne\"> الوثائق المكونة لملف رخصة بناء</a></h4>\r\n</div>\r\n<div id=\"collapseOne\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p style=\"text-align: right;\">كل مواطن يرغب في إقامة بناء أو القيام بترميم بناء قديم , أو إجراء إصلاحات عليه مطالب باستخراج رخصة بناء.</p>\r\n<p style=\"text-align: right;\">لأجل ذلك عليه الإستظهار بالوثائق التالية :</p>\r\n<ol style=\"text-align: right;\">\r\n<li>مطلب على ورق عادي ممضى من قبل طالب الرخصة أو من ينوبه.(2 نظائر)</li>\r\n<li>شهادة ملكية أو حكم استحقاقي أو وثيقة أخرى تثبت أن قطعة الأرض المزمع إقامة البناء عليها ملك له.</li>\r\n<li>(2 نظائر(</li>\r\n<li>بطاقة إرشادات فنية تسلم من قبل الإدارة ممضاة من طرف المهندس المعماري مصمم المشروع.(2 نظائر(</li>\r\n<li>مشروع بناء في خمسة نظائر . (5 نظائر(</li>\r\n</ol>\r\n<p style=\"text-align: right;\">&nbsp; وصل إيداع التصريح بالضريبة على دخل الأشخاص الطبيعيين أو الضريبة على الشركات . (5 نظائر(</p>\r\n<ol>\r\n<li style=\"text-align: right;\">شهادة خلاص المعاليم الموظفة على صاحب العقار.</li>\r\n<li style=\"text-align: right;\">دراسة فنية للنجاعة الحرارية للمباني المعدة للسكن الجماعي و للمباني المعدة للمكاتب و التي تفوق مساحتها 500م2 معدة من طرف مهندس معماري أو مكتب دراسات و مصادق عليها من طرف مكتب مراقب مرخص من وزارة التجهيز و الإسكان</li>\r\n<li style=\"text-align: right;\">مذكرة تقديمية (2 نظائر(</li>\r\n<li style=\"text-align: right;\">نسخة من بطاقة التعريف (2 نظائر(</li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingTwo\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseTwo\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseTwo\"> معاليم رخص البناء </a></h4>\r\n</div>\r\n<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p style=\"text-align: right;\">المعلوم الموظف على : البناء الفردي، بناء مزدوج أو جماعي وتمديد أو تجديد رخصة بناء.</p>\r\n<table style=\"border-color: #000000; width: 567px; float: right;\" border=\"1\" width=\"567\">\r\n<tbody>\r\n<tr>\r\n<td width=\"228\">\r\n<p>معلوم اضافي (دينار/ &nbsp; المتر المربع(</p>\r\n</td>\r\n<td width=\"177\">\r\n<p>معلوم قار (د(</p>\r\n</td>\r\n<td width=\"162\">\r\n<p>المساحة المغطاة</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"228\">\r\n<p>0,100 د /م &sup2;</p>\r\n</td>\r\n<td width=\"177\">\r\n<p>15.000</p>\r\n</td>\r\n<td width=\"162\">\r\n<p>1 إلى 100م2</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"228\">\r\n<p>0,300 د /م &sup2;</p>\r\n</td>\r\n<td width=\"177\">\r\n<p>60.000</p>\r\n</td>\r\n<td width=\"162\">\r\n<p>1 إلى 200م2</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"228\">\r\n<p>0,400 د /م &sup2;</p>\r\n</td>\r\n<td width=\"177\">\r\n<p>120.000</p>\r\n</td>\r\n<td width=\"162\">\r\n<p>1 إلى 300م2</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"228\">\r\n<p>0,600 د /م &sup2;</p>\r\n</td>\r\n<td width=\"177\">\r\n<p>300.000</p>\r\n</td>\r\n<td width=\"162\">\r\n<p>1 إلى 400م2</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td width=\"228\">\r\n<p>1,000 د /م &sup2;</p>\r\n</td>\r\n<td width=\"177\">\r\n<p>750.000</p>\r\n</td>\r\n<td width=\"162\">\r\n<p>أكثر من 400م2</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'dossier-de-permis-de-batir', 'PUBLISHED', 0, NULL, '2019-11-08 09:26:34', '2019-11-12 13:48:21', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(28, 'Autorisation de raccordement aux réseaux publics(SONEDE,STEG)', 'رخصة ربط بشبكة الكهرباء و الماء', NULL, NULL, '<div id=\"accordion\" class=\"panel-group accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseOne\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseOne\"> المراجع التشريعية و الترتيبية:</a></h4>\r\n</div>\r\n<div id=\"collapseOne\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li>الفصل81 الفقرة الأولى من القانون الأساسي للبلديات عدد 33 لسنة 1975 المؤرخ في 14 ماي 1975 كما تم إتمامه وتنقيحه بالنصوص اللاحقة،</li>\r\n<li>القانون عدد 122 لسنة 1994 المؤرخ في 28 نوفمبر 1994 المتعلق بإصدار مجلة التهيئة الترابية والتعميركما تم إتمامه و تنقيحه بالنصوص اللاحقة</li>\r\n<li>القرار البلدي المتعلق بضبط تعريفة المعاليم المرخص للجماعات المحلية في استخلاصها.</li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingTwo\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseTwo\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseTwo\"> شروط الانتفاع بالخدمة </a></h4>\r\n</div>\r\n<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li>يجب أن يكون المحل موضوع طلب الترخيص مبنيا وفقا لرخصة بناء.</li>\r\n<li>إذا كان المحل المعني غير مبني وفقا لرخصة بناء، فإنه يتم اتخاذ قرار اسناد الترخيص من عدمه عن طريق لجنة فنية خاصة مكونة للغرض.</li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFour\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFour\"> مكـــــان إيــــداع الملــــف:</a></h4>\r\n</div>\r\n<div id=\"collapseFour\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p>- المصلحة الفنية ذات النظر بالبلدية أو بالدائرة البلدية</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFive\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFive\"> مكان الحصول على الخدمة :</a></h4>\r\n</div>\r\n<div id=\"collapseFive\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p>- المصلحة الفنية ذات النظر بالبلدية أو الدائرة البلدية</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSix\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSix\"> أجل الحصول على الخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseSix\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p>15 يوما من تاريخ إيداع المطلب.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"heading7\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapse7\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapse7\">ملاحظــــات</a></h4>\r\n</div>\r\n<div id=\"collapse7\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"heading7\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ul>\r\n<li>كل عقار يمثل وحدة مستقلة يمكن أن تسند في شأنه رخصة واحدة سواء للربط بشبكة الماء أو الكهرباء.</li>\r\n<li>كل رخصة مسندة تخول تركيز عداد واحد لا غير.</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'autorisation-de-raccordement-aux-reseaux-publics-sonede-steg', 'PUBLISHED', 0, NULL, '2019-11-08 09:39:48', '2019-11-08 09:40:43', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(29, 'Autorisation de raccordement aux réseaux publics ONAS', 'رخصة ربط بشبكة التطهير', NULL, NULL, '<div id=\"accordion\" class=\"panel-group accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFour\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFour\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFour\">المراجع التشريعية و الترتيبية</a></h4>\r\n</div>\r\n<div id=\"collapseFour\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFour\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p style=\"text-align: right;\">- القانون الأساسي للبلديات عدد 33 لسنة 1975 المؤرخ في 14 ماي 1975 و النصوص المنقحة و المتممة له و خاصة القانون الأساسي عدد 48 لسنة 2006 المؤرخ في 17 جويلية 2006.</p>\r\n<p style=\"text-align: right;\">- القانون عدد 122 لمنة 1994 المؤرخ في 28 نوفمبر 1994 المتعلق بإصدار مجلة التهيئة الترابية و التعمير.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl; text-align: right;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseOne\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseOne\"> شروط الانتفاع بالخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseOne\" class=\"panel-collapse collapse\" style=\"height: 0px; text-align: right;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p style=\"text-align: right;\">- المحل المبني وفقا لرخصة بناء ليس في حاجة إلى ترخيص. يمكن للمو١طن الإتصال مباشرة بالديوان الوطني للتطهير(ONAS).</p>\r\n<p style=\"text-align: right;\">- إذا كان المحل المعني غير مبني وفقا لرخصة بناء، فإنه يتم اتخاذ قرار اسناد الترخيص من عدمه عن طريق لجنة فنية خاصة مكونة للغرض.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingTwo\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseTwo\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">الوثائق المطلوبة</a></h4>\r\n</div>\r\n<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p style=\"text-align: right;\">1. مطلب على ورق عادي ممضى من قبل الطالب ومتضمنا للبيانات الضرورية: العنوان و مراجع رخصة البناء.</p>\r\n<p style=\"text-align: right;\">2. شهادة ملكية أو مايعادلها للعقار موضوع الطلب.</p>\r\n<p style=\"text-align: right;\">٠3 شهادة ابراء في خلاص المعاليم البلدية آلموظفة على كل العقارات داخل المنطقة البلدية.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingThree\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseThree\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseThree\">الأجال</a></h4>\r\n</div>\r\n<div id=\"collapseThree\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingThree\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p style=\"text-align: right;\">في أجل شهر بداية من تاريخ ايداع الملف.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\" style=\"text-align: right;\">\r\n<div id=\"headingFive\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\" style=\"direction: rtl;\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFive\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFive\">إجراءات إنجاز الخدمة</a></h4>\r\n</div>\r\n<div id=\"collapseFive\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingFive\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<p style=\"text-align: right;\">- استلام الملف</p>\r\n<p style=\"text-align: right;\">- دراسة الملف و اجراء المعاينات الميدانية</p>\r\n<p style=\"text-align: right;\">- عرض الملف على اللجنة المحلية</p>\r\n<p style=\"text-align: right;\">- تسليم الرخصة للمواطن</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'autorisation-de-raccordement-aux-reseaux-publics-onas', 'PUBLISHED', 0, NULL, '2019-11-08 09:43:26', '2019-11-08 09:49:03', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(30, 'Autorisations D\'occupation', 'رخصة إشغال', NULL, NULL, NULL, NULL, '[]', NULL, NULL, NULL, 'autorisations-d-occupation', 'PUBLISHED', 0, NULL, '2019-11-08 09:50:56', '2019-11-08 09:52:31', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(31, 'Autorisations Économiques', 'التراخيص الإقتصادية', NULL, NULL, '<h5 dir=\"rtl\">&nbsp;</h5>\r\n<h5 dir=\"rtl\"><span style=\"color: #ff0000;\">رخصة في الإشغال الوقتي للطريق العام :</span></h5>\r\n<p dir=\"rtl\"><span style=\"color: #000000;\">-مطلب باسم السيد رئيس البلدية محرر على ورق عادي يتضمن النشاطa , المساحة و فترة الإشغال.</span></p>\r\n<p dir=\"rtl\"><span style=\"color: #000000;\">-نسخة من بطاقة التعريف الوطنية .</span></p>\r\n<p dir=\"rtl\"><span style=\"color: #000000;\">-مثال موقعي لمكان المزمع الإنتصاب به .</span></p>\r\n<p dir=\"rtl\"><span style=\"color: #000000;\">-المعلوم : حسب المساحة المستغلة و فترة الإشغال ( 150 مليم بحساب المتر المربع في اليوم ).</span></p>\r\n<h5 dir=\"rtl\"><span style=\"color: #ff0000;\">رخصة تركيز العلامات الإشهارية ذات الصبغة التجارية على المحلات المفتوحة للعموم و على الملك العمومي البلدي :</span></h5>\r\n<p dir=\"rtl\">&nbsp;<span style=\"color: #000000;\">-مطلب باسم السيد رئيس البلدية محرر على ورق عادي يتضمن&nbsp; مساحة المعلقة الإشهارية و مكان المحل أو الملك العمومي البلدي .</span></p>\r\n<p dir=\"rtl\"><span style=\"color: #000000;\">-نسخة من بطاقة التعريف الوطنية .</span></p>\r\n<p dir=\"rtl\"><span style=\"color: #000000;\">-نسخة من بطاقة التعريف الجبائية .</span></p>', NULL, '[]', NULL, NULL, NULL, 'autorisations-economiques', 'PUBLISHED', 0, NULL, '2019-11-08 09:52:11', '2019-11-08 10:03:31', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(33, 'Les commissions des permis de bâtir', 'جلسات رخص البناء', NULL, NULL, NULL, NULL, '[]', NULL, NULL, NULL, 'les-commissions-des-permis-de-batir', 'PUBLISHED', 0, NULL, '2019-11-08 10:09:49', '2020-08-12 11:59:13', NULL, '1', '1', NULL, NULL, NULL, '[]'),
(34, 'Accès aux documents administratifs', 'النفاذ إلى الوثائق الإدراية', NULL, '<div id=\"accordion\" class=\"panel-group accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFive\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFive\"> Le cadre r&eacute;glementaire d\'acc&egrave;s aux documents administratifs</a></h4>\r\n</div>\r\n<div id=\"collapseFive\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">D&eacute;cret-loi n&deg; 2011-41 du 26 mai 2011, relatif &agrave; l\'acc&egrave;s aux documents administratifs des organismes publics<br /><a href=\"/public/storage/Acces-aux-documents-administratifs/Decret-loi2011_54.pdf\" target=\"_blank\" rel=\"noopener noreferrer\">D&eacute;cret-loi n&deg; 2011-54 du 11 juin 2011</a>, modifiant et compl&eacute;tant <a href=\"/public/storage/Acces-aux-documents-administratifs/Decret-loi2011_41.pdf\" target=\"_blank\" rel=\"noopener noreferrer\">le d&eacute;cret-loi n&deg; 2011-41 du 26 mai 2011</a> relatif &agrave; l\'acc&egrave;s aux documents administratifs des organismes publics.<br /><a href=\"/public/storage/Acces-aux-documents-administratifs/circulaire25-05mai2012.pdf\" target=\"_blank\" rel=\"noopener noreferrer\">Circulaire n&deg; 25 du 05 mai 2012</a> relative &agrave; l\'acc&egrave;s aux documents administratifs des organismes publics.<br /><a href=\"/public/storage/Acces-aux-documents-administratifs/loi22.pdf\" target=\"_blank\" rel=\"noopener noreferrer\">Loi organique relative au droit d\'acc&egrave;s &agrave; l\'information (Ar)</a>.</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseSix\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseSix\"> Politique d\'acc&egrave;s aux documents administratifs</a></h4>\r\n</div>\r\n<div id=\"collapseSix\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">L\'Open Data d&eacute;signe le mouvement visant &agrave; rendre accessible &agrave; tous ,via le web ,les donn&eacute;es publiques non nominatives ne relevant ni de la vie priv&eacute;e et ni de la s&eacute;curit&eacute; collect&eacute;es par les organismes public<br />Pour d&eacute;finir ce concept on peut se r&eacute;f&eacute;rer &agrave; la d&eacute;finition avanc&eacute;e par le site <a href=\"http://www.opendefinition.org/government/\" target=\"_blank\" rel=\"noopener noreferrer\">www.opendefinition.org/government/</a> qui la d&eacute;finit comme &eacute;tant : &laquo; Les donn&eacute;es qu\'on peut acc&eacute;der ; r&eacute;utiliser et redistribuer librement &raquo;. Ainsi une donn&eacute;e ouverte doit ob&eacute;ir &agrave; trois crit&egrave;res <br />Libre acc&egrave;s,<br />Libre r&eacute;utilisation,<br />Libre redistribution.<br />Les promoteurs de l\'OpenData &agrave; l\'&eacute;chelle internationale, ont d&eacute;velopp&eacute; des d&eacute;finitions formelles des crit&egrave;res qui caract&eacute;risent les donn&eacute;es ouvertes. Les crit&eacute;res les plus utilis&eacute;s sont ceux qui sont propos&eacute;es par l\'Open Knowledge Foundation (OKFN) et qui sont les suivants :<br />Compl&egrave;tes : Toutes les donn&eacute;es sont mises &agrave; disposition. Les donn&eacute;es publiques sont des donn&eacute;es qui ne sont pas sujettes &agrave; des limitations valables concernant la vie priv&eacute;e, la s&eacute;curit&eacute; ou des privil&egrave;ges d\'acc&egrave;s.<br />Primaires ou brutes : Les donn&eacute;es sont telles que collect&eacute;es &agrave; la source, avec la plus grande granularit&eacute; possible, et ne se pr&eacute;sentent pas sous des formes agr&eacute;g&eacute;es ou modifi&eacute;es.\r\n<p>&nbsp;</p>\r\n<p>&bull;Opportunes ou r&eacute;centes : Elles sont mises &agrave; disposition aussi rapidement que n&eacute;cessaire pour pr&eacute;server leur valeur.</p>\r\n<p>&bull;Accessibles : Les donn&eacute;es sont accessibles au plus grand &eacute;ventail d\'utilisateurs possible et pour des usages aussi divers que possible.</p>\r\n<p>&bull;Lisibles par des machines : Les donn&eacute;es sont structur&eacute;es pour permettre le traitement automatis&eacute; et disponibles sous une forme pratique et modifiable.</p>\r\n<p>&bull;Conditions non discriminatoires : les donn&eacute;es sont accessibles &agrave; quiconque sans aucune obligation pr&eacute;alable ni inscription, et sans discrimination entre les domaines d\'application. Les donn&eacute;es sont notamment disponibles aussi bien pour des r&eacute;utilisations commerciales que personnelles.</p>\r\n<p>&bull;Formats non-propri&eacute;taires : les donn&eacute;es sont accessibles dans un format sur lequel aucune entit&eacute; n\'a de contr&ocirc;le exclusif.</p>\r\n<p>&bull;Donn&eacute;es libres de droits : les donn&eacute;es ne sont pas soumises au droit d\'auteur, &agrave; un brevet, aux droits des marques, ou au secret commercial. Des r&egrave;gles raisonnables de confidentialit&eacute;, de s&eacute;curit&eacute; et de priorit&eacute; d\'acc&egrave;s peuvent &ecirc;tre admises.</p>\r\n<p>A cot&eacute; de ce bouquet de crit&egrave;res qui d&eacute;finissent une donn&eacute;e ouverte, d\'autres crit&egrave;res r&eacute;gissent la r&eacute;utilisation des donn&eacute;es ouvertes et qui doivent &ecirc;tre mentionn&eacute;s au niveau de la licence de r&eacute;utilisation. Ces crit&egrave;res sont :<br />Paternit&eacute; : la licence peut exiger, comme condition pour la redistribution et la r&eacute;utilisation des donn&eacute;es, d\'identifier clairement les cr&eacute;ateurs de l\'&oelig;uvre ou les contributeurs initiaux. Si cette condition est impos&eacute;e, elle ne doit pas &ecirc;tre ind&ucirc;ment complexe &agrave; remplir, et notamment la liste des contributeurs &agrave; citer doit &ecirc;tre clairement indiqu&eacute;e.<br />Distribution de la licence : les droits attach&eacute;s aux donn&eacute;es s\'appliquent &agrave; tous ceux &agrave; qui elles sont distribu&eacute;es.<br />Non-transitivit&eacute; de la licence : la licence ne peut exiger que toute donn&eacute;e distribu&eacute;e conjointement avec une donn&eacute;e sous licence libre soit aussi elle-m&ecirc;me sous licence libre, ce qui serait un frein &agrave; la r&eacute;utilisation de ces donn&eacute;es.<br />Droit d\'extraction : si les donn&eacute;es sont extraites d\'un jeu de donn&eacute;es, les utilisateurs de l\'extrait doivent b&eacute;n&eacute;ficier des m&ecirc;mes droits que ceux qui sont accord&eacute;s au jeu de donn&eacute;es dans son ensemble .Bien que ce mod&egrave;le des donn&eacute;es ouvertes puisse s\'appliquer &agrave; tous types de donn&eacute;es, qu\'elles soient produites par le secteur public ou non, l\'importance d&eacute;mocratique de l\'acc&egrave;s aux informations publiques a conduit &agrave; focaliser le d&eacute;bat sur l\'Open Government Data, ou la r&eacute;utilisation des donn&eacute;es publiques.</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseFour\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseFour\"> Les demandes d\'acc&egrave;s aux documents administratifs</a></h4>\r\n</div>\r\n<div id=\"collapseFour\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">&bull; demande d\'acc&egrave;s a un document administratif<br />&bull; demande de contestation\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingTwo\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseTwo\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseTwo\"> Donn&eacute;es sp&eacute;cifiques </a></h4>\r\n</div>\r\n<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">&bull;Liste des charg&eacute;s d\'acc&egrave;s aux documents administratifs (Ar)<br />pour plus de d&eacute;tails, visitez le site web de l\'open data <a href=\"http://www.data.gov.tn\" target=\"_blank\" rel=\"noopener noreferrer\">www.data.gov.tn&nbsp;</a>\r\n<p>&nbsp;</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', '<div id=\"accordion\" class=\"panel-group accordion\" role=\"tablist\" aria-multiselectable=\"true\">\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingOne\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseOne\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseOne\"> النصوص القانونية المتعلقة بالبيانات المفتوحة</a></h4>\r\n</div>\r\n<div id=\"collapseOne\" class=\"panel-collapse collapse\" style=\"height: 0px;\" role=\"tabpanel\" aria-labelledby=\"headingOne\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">\r\n<ol>\r\n<li dir=\"rtl\" style=\"text-align: right;\"><a style=\"line-height: 1.3em;\" href=\"/public/storage/Acces-aux-documents-administratifs/loi22.pdf\" target=\"_blank\" rel=\"noopener noreferrer\">القانون الأساسي عدد 22 المتعلق بالنفاذ إلي المعلومة</a></li>\r\n<li dir=\"rtl\" style=\"text-align: right;\"><a title=\"منشور عدد 19 الخاص بالنفاذ للمعلومة\" href=\"/public/storage/Acces-aux-documents-administratifs/decret19.pdf\" target=\"_blank\" rel=\"noopener noreferrer\">منشور عدد 19 الخاص بالنفاذ للمعلومة</a></li>\r\n<li><a href=\"/public/storage/Acces-aux-documents-administratifs/demande01.pdf\" target=\"_blank\" rel=\"noopener noreferrer\">مطلب النفاذ للمعلومة</a></li>\r\n<li><a href=\"/public/storage/Acces-aux-documents-administratifs/demande02.pdf\" target=\"_blank\" rel=\"noopener noreferrer\">مطلب تظلم</a></li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"panel panel-default\">\r\n<div id=\"headingTwo\" class=\"panel-heading\" role=\"tab\">\r\n<h4 class=\"panel-title\"><a class=\"collapsed\" role=\"button\" href=\"#collapseTwo\" data-toggle=\"collapse\" data-parent=\"#accordion\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">بيانات خصوصية </a></h4>\r\n</div>\r\n<div id=\"collapseTwo\" class=\"panel-collapse collapse\" role=\"tabpanel\" aria-labelledby=\"headingTwo\" aria-expanded=\"false\">\r\n<div class=\"panel-body\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'acces-aux-documents-administratifs', 'PUBLISHED', 0, NULL, '2019-11-08 10:19:06', '2020-10-21 13:09:06', NULL, '1', '1', NULL, NULL, NULL, '[]'),
(53, 'Protection socio-environnemental', 'حماية البيئة و المحيط', NULL, NULL, NULL, NULL, '[]', NULL, NULL, NULL, 'protection-socio-environnemental', 'PUBLISHED', 0, NULL, '2019-11-08 11:37:16', '2019-11-08 11:37:16', NULL, '1', NULL, NULL, NULL, NULL, '[]'),
(54, 'Références légales', 'المراجع القانونية', NULL, NULL, '<ul>\r\n<li style=\"text-align: right;\"><span style=\"color: #333333;\"><strong>القانون الأساسي للبلديات عدد 29 لسنة 2018</strong></span></li>\r\n</ul>\r\n<h2 style=\"color: #000000; font-family: Saira, Arial, Helvetica, sans-serif; letter-spacing: 0.25px; margin-top: 0px; text-align: right;\"><span style=\"color: #333333;\">معلومات متعلقة بالنص:</span></h2>\r\n<p style=\"color: #000000; font-family: Saira, Arial, Helvetica, sans-serif; letter-spacing: 0.25px; text-align: right;\"><span style=\"background-color: #ffffff; color: #333333;\"><span class=\"label\" style=\"font-weight: bold;\">صنف النص:&nbsp;</span>قانون أساسي</span></p>\r\n<p style=\"color: #000000; font-family: Saira, Arial, Helvetica, sans-serif; letter-spacing: 0.25px; text-align: right;\"><span style=\"color: #333333;\"><span class=\"label\" style=\"font-weight: bold;\">عدد النص:&nbsp;</span>29</span></p>\r\n<p style=\"color: #000000; font-family: Saira, Arial, Helvetica, sans-serif; letter-spacing: 0.25px; text-align: right;\"><span style=\"color: #333333;\"><span class=\"label\" style=\"font-weight: bold;\">تاريخ النص:&nbsp;</span>09.05.2018</span></p>\r\n<p style=\"color: #000000; font-family: Saira, Arial, Helvetica, sans-serif; letter-spacing: 0.25px; text-align: right;\"><span style=\"color: #333333;\"><span class=\"label\" style=\"font-weight: bold;\">الوزارة / الهيكل:&nbsp;</span>وزارة الشؤون المحلية</span></p>\r\n<p style=\"color: #000000; font-family: Saira, Arial, Helvetica, sans-serif; letter-spacing: 0.25px; text-align: right;\"><span style=\"color: #333333;\"><span class=\"label\" style=\"font-weight: bold;\">حالة النص:&nbsp;</span>ساري المفعول</span></p>\r\n<div class=\"gazette\" style=\"color: #000000; font-family: Saira, Arial, Helvetica, sans-serif; letter-spacing: 0.25px;\">\r\n<p style=\"text-align: right;\"><span style=\"color: #333333;\"><span class=\"label\" style=\"font-weight: bold;\">عدد الرائد الرسمي:&nbsp;</span>39</span></p>\r\n<p style=\"text-align: right;\"><span style=\"color: #333333;\"><span class=\"label\" style=\"font-weight: bold;\">تاريخ الرائد الرسمي:&nbsp;</span>15.05.2018</span></p>\r\n<p style=\"text-align: right;\">&nbsp;</p>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'references-legales', 'PUBLISHED', 0, NULL, '2020-08-11 10:29:41', '2022-10-25 14:39:56', NULL, '1', '1', NULL, NULL, NULL, NULL),
(56, 'Historique de la ville', 'تاريخ المدينة', NULL, NULL, '<div id=\"tm-block-footer\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">\r\n<div class=\"uk-container uk-container-center\">\r\n<section class=\" tm-block-footer uk-grid uk-grid-match uk-grid-collapse\" data-uk-grid-match=\"{target:\'&gt; div &gt; .uk-panel\'}\" data-uk-grid-margin=\"\">\r\n<div class=\"uk-width-1-1 uk-width-medium-1-3\">\r\n<div class=\"uk-panel uk-panel-box jmoddiv\" data-jmodediturl=\"https://commune-aousja.tn/index.php?option=com_config&amp;controller=config.display.modules&amp;id=548&amp;Itemid=1142&amp;return=aHR0cHM6Ly9jb21tdW5lLWFvdXNqYS50bi9pbmRleC5waHA%2Fb3B0aW9uPWNvbV9jb250ZW50JnZpZXc9YXJ0aWNsZSZpZD0xMDkmSXRlbWlkPTExNDImbGFuZz1hcg%3D%3D\" data-target=\"_self\" data-jmodtip=\"&lt;strong&gt;تحرير الموديول&lt;/strong&gt;&lt;br /&gt;روابط مفيدة&lt;br /&gt;الموضع: block-footer\">&nbsp;</div>\r\n</div>\r\n</section>\r\n</div>\r\n</div>\r\n<div class=\"tm-inner-container uk-container uk-container-center\" style=\"color: #000000; font-family: \'Times New Roman\'; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">\r\n<div class=\"tm-container\">\r\n<div id=\"tm-middle\" class=\"tm-middle uk-grid\" data-uk-grid-match=\"\" data-uk-grid-margin=\"\">\r\n<div class=\"tm-main uk-width-medium-1-1\"><main id=\"tm-content\" class=\"tm-content\">\r\n<article class=\"uk-article tm-article\">\r\n<div class=\"tm-article-wrapper\">\r\n<div class=\"tm-article-content uk-margin-top-remove\">\r\n<div class=\"tm-article\">\r\n<p dir=\"rtl\">تعتبر عوسجة منطقة فلاحيه&nbsp;&nbsp;باعتبار أهمية النشاط الفلاحي بها&nbsp;&nbsp;تحتوي أيضا على&nbsp;&nbsp;نشاط صناعي&nbsp;&nbsp;من خلال&nbsp;&nbsp;5 وحدات&nbsp;&nbsp;&nbsp;صناعية&nbsp;&nbsp;مصدرة&nbsp;&nbsp;كليا&nbsp;&nbsp;للخياطة و مجمع&nbsp;&nbsp;بريد و منشأة&nbsp;&nbsp;&nbsp;بنكية و مركز بريد .</p>\r\n<p dir=\"rtl\">تتميز مدينة عوسجة بسوقها الأسبوعي يوم الأحد&nbsp;&nbsp;الذي يتميز بحركة تجارية كبرى باعتبار&nbsp;&nbsp;موقع&nbsp;&nbsp;المدينة المميز كنقطة عبور و باعتبار&nbsp;&nbsp;طبيعة&nbsp;&nbsp;المنتوج&nbsp;&nbsp;&nbsp;ألفلاحي به&nbsp;&nbsp;الطازج&nbsp;&nbsp;و لذي يشجع على ارتياد السوق&nbsp;&nbsp;من مناطق مختلفة .</p>\r\n<p dir=\"rtl\">تتميز المدينة بثروة طبيعية&nbsp;&nbsp;هامة&nbsp;&nbsp;و أرض خصبة&nbsp;&nbsp;.</p>\r\n<p dir=\"rtl\">كما&nbsp;&nbsp;تتميز&nbsp;&nbsp;بسد جبلي&nbsp;&nbsp;بمنطقة - سيدي حسين-&nbsp;&nbsp;&nbsp;يشكل ثروة مائية هامة .</p>\r\n</div>\r\n</div>\r\n</div>\r\n</article>\r\n</main></div>\r\n</div>\r\n</div>\r\n</div>', NULL, '[]', NULL, NULL, NULL, 'historique-de-la-ville', 'PUBLISHED', 0, NULL, '2020-08-17 09:41:45', '2022-10-25 14:13:48', NULL, '1', '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `articles_travaux_associations`
--

CREATE TABLE `articles_travaux_associations` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `titre_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_ar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `date_publication` date DEFAULT NULL,
  `lienDocument` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomAssociation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomAssociation_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `article_pieces_jointes`
--

CREATE TABLE `article_pieces_jointes` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `nom_fichier` varchar(255) DEFAULT NULL,
  `lien_fichier` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nom_fichier_fr` varchar(255) DEFAULT NULL,
  `nom_fichier_ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `article_pieces_jointes`
--

INSERT INTO `article_pieces_jointes` (`id`, `article_id`, `nom_fichier`, `lien_fichier`, `created_at`, `updated_at`, `nom_fichier_fr`, `nom_fichier_ar`) VALUES
(23, NULL, 'القانون الأساسي للبلديات عدد 29 لسنة 2018', 'articles/LoiOrganique29-2018.pdf', '2022-10-25 14:27:50', '2022-10-25 14:27:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `budget_partcipatifs`
--

CREATE TABLE `budget_partcipatifs` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Annee` int(11) DEFAULT NULL,
  `titre_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TypeBudget` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Document` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` longtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(5, NULL, 1, 'Avis', 'avis', '2019-10-11 15:21:15', '2019-10-11 15:21:15');

-- --------------------------------------------------------

--
-- Structure de la table `citoyens`
--

CREATE TABLE `citoyens` (
  `id` int(10) UNSIGNED NOT NULL,
  `CIN` varchar(255) NOT NULL,
  `NomPrenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `Tel` varchar(255) DEFAULT NULL,
  `Login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `Etat` tinyint(4) DEFAULT NULL,
  `ConfirmePar` varchar(255) DEFAULT NULL,
  `DateInscription` datetime DEFAULT NULL,
  `DateSuspension` datetime DEFAULT NULL,
  `RaisonSuspension` varchar(255) DEFAULT NULL,
  `SuspenduPar` varchar(255) DEFAULT NULL,
  `DateDernierCnxion` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `modifierPar` varchar(255) DEFAULT NULL,
  `creerPar` varchar(255) DEFAULT NULL,
  `TypeCompte` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `conseil_municipales`
--

CREATE TABLE `conseil_municipales` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Annee` int(11) DEFAULT NULL,
  `titre_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TitreEN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TypeConseil` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FichierConseil` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_publication` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `adresse_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ATTENTE',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `service_ar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_en` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `creerPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifierPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`id`, `fax`, `telephone`, `email`, `adresse_fr`, `deleted_at`, `created_at`, `updated_at`, `adresse_ar`, `adresse_en`, `seo_title`, `meta_description`, `meta_keywords`, `status`, `slug`, `featured`, `service_ar`, `service_fr`, `service_en`, `creerPar`, `modifierPar`, `approuverPar`, `approuverLe`, `depublierLe`) VALUES
(1, '77485211', '77485210', 'mail@gmail.com', 'Avenue Ouled Haffouz - 1030 Tunis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PUBLISHED', NULL, 0, '', NULL, NULL, '1', NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, 'dfgdfgfd', NULL, '2020-01-22 06:31:48', NULL, 'fdgfdg', 'fdgdf', 'jhgjkh', NULL, NULL, 'PUBLISHED', 'jhgjkh', 0, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cooperations`
--

CREATE TABLE `cooperations` (
  `id` int(10) UNSIGNED NOT NULL,
  `titre_fr` varchar(255) DEFAULT NULL,
  `vignette` text DEFAULT NULL,
  `description_fr` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `titre_ar` varchar(255) DEFAULT NULL,
  `description_ar` text DEFAULT NULL,
  `titre_en` varchar(255) DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `alt` int(11) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `carousel` varchar(255) DEFAULT NULL,
  `creerPar` varchar(255) DEFAULT NULL,
  `modifierPar` varchar(255) DEFAULT NULL,
  `approuverPar` varchar(255) DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `DateCooperation` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(56, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(60, 8, 'created_at', 'timestamp', 'Date de création', 0, 1, 1, 0, 0, 1, '{}', 16),
(61, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 1, '{}', 17),
(62, 8, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 18),
(63, 8, 'titre_fr', 'text', 'Titre', 0, 0, 1, 1, 1, 1, '{}', 4),
(64, 8, 'description_fr', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 5),
(65, 8, 'titre_ar', 'text', 'عنوان الخبر', 0, 1, 1, 1, 1, 1, '{}', 6),
(66, 8, 'description_ar', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 7),
(67, 8, 'titre_en', 'text', 'Title', 0, 0, 1, 1, 1, 1, '{}', 8),
(68, 8, 'description_en', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 9),
(73, 8, 'alt', 'text', 'Alt', 0, 0, 1, 1, 1, 1, '{}', 3),
(75, 8, 'vignette', 'media_picker', 'Vignette', 0, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0},\"thumbnails\":[{\"type\":\"resize\",\"name\":\"resize-500-500\",\"width\":500,\"height\":500}]}', 2),
(105, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(106, 13, 'fax', 'text', 'Fax', 0, 1, 1, 1, 1, 1, '{}', 2),
(107, 13, 'telephone', 'text', 'Téléphone', 0, 1, 1, 1, 1, 1, '{}', 3),
(108, 13, 'email', 'text', 'E-mail', 0, 1, 1, 1, 1, 1, '{}', 4),
(109, 13, 'adresse_fr', 'text', 'Adresse', 0, 1, 1, 1, 1, 1, '{}', 5),
(110, 13, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 1, 1, 1, '{}', 8),
(111, 13, 'created_at', 'timestamp', 'Date de création', 0, 0, 1, 1, 0, 1, '{}', 9),
(112, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 1, 1, 1, '{}', 10),
(113, 13, 'adresse_ar', 'text', 'العنوان', 0, 0, 1, 1, 1, 1, '{}', 6),
(114, 13, 'adresse_en', 'text', 'Adress', 0, 0, 1, 1, 1, 1, '{}', 7),
(115, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(116, 14, 'titre_fr', 'text', 'Titre', 0, 0, 1, 1, 1, 1, '{}', 3),
(117, 14, 'Vignette', 'media_picker', 'Vignette', 0, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 2),
(118, 14, 'Alt', 'text', 'Alt', 0, 0, 1, 1, 1, 1, '{}', 5),
(119, 14, 'date_debut', 'date', 'Date Début', 0, 1, 1, 1, 1, 1, '{}', 6),
(120, 14, 'date_fin', 'date', 'Date Fin', 0, 1, 1, 1, 1, 1, '{}', 7),
(121, 14, 'lieu_fr', 'text', 'Lieu', 0, 0, 1, 1, 1, 1, '{}', 9),
(122, 14, 'created_at', 'timestamp', 'Date de création', 0, 0, 1, 0, 0, 1, '{}', 15),
(123, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 1, '{}', 16),
(124, 14, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 17),
(125, 14, 'titre_ar', 'text', 'اسم الندوة / الملتقى', 0, 1, 1, 1, 1, 1, '{}', 4),
(126, 14, 'lieu_ar', 'text', 'المكان', 0, 1, 1, 1, 1, 1, '{}', 8),
(127, 14, 'titre_en', 'text', 'Titre', 0, 0, 1, 1, 1, 1, '{}', 11),
(128, 14, 'lieu_en', 'text', 'Lieu', 0, 0, 1, 1, 1, 1, '{}', 12),
(129, 14, 'description_fr', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 10),
(130, 14, 'description_ar', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 14),
(131, 14, 'description_en', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 13),
(185, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(186, 19, 'theme_fr', 'text', 'Thème', 0, 1, 1, 1, 1, 1, '{}', 2),
(187, 19, 'theme_ar', 'text', 'الموضوع القانوني', 0, 1, 1, 1, 1, 1, '{}', 3),
(188, 19, 'theme_en', 'text', 'Theme', 0, 1, 1, 1, 1, 1, '{}', 4),
(189, 19, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 8),
(190, 19, 'created_at', 'timestamp', 'Date de création', 0, 1, 1, 0, 0, 1, '{}', 9),
(191, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 1, '{}', 10),
(192, 19, 'texte_juridique_fr', 'rich_text_box', 'Texte Juridique', 0, 0, 1, 1, 1, 1, '{}', 5),
(193, 19, 'texte_juridique_ar', 'rich_text_box', 'Texte Juridique', 0, 0, 1, 1, 1, 1, '{}', 6),
(194, 19, 'texte_juridique_en', 'rich_text_box', 'Texte Juridique', 0, 0, 1, 1, 1, 1, '{}', 7),
(195, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(196, 20, 'type_fr', 'text', 'Type', 0, 1, 1, 1, 1, 1, '{}', 2),
(197, 20, 'type_ar', 'text', 'Type', 0, 0, 1, 1, 1, 1, '{}', 3),
(198, 20, 'type_en', 'text', 'Type', 0, 0, 1, 1, 1, 1, '{}', 4),
(199, 20, 'texte_juridique_fr', 'rich_text_box', 'Texte Juridique', 0, 0, 1, 1, 1, 1, '{}', 5),
(200, 20, 'texte_juridique_ar', 'rich_text_box', 'Texte Juridique', 0, 0, 1, 1, 1, 1, '{}', 6),
(201, 20, 'texte_juridique_en', 'rich_text_box', 'Texte Juridique', 0, 0, 1, 1, 1, 1, '{}', 7),
(202, 20, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 8),
(203, 20, 'created_at', 'timestamp', 'Date de création', 0, 1, 1, 0, 0, 1, '{}', 9),
(204, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 1, '{}', 10),
(234, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(235, 23, 'titre_fr', 'text', 'Titre', 0, 0, 1, 1, 1, 1, '{}', 4),
(236, 23, 'image', 'media_picker', 'Image', 0, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 2),
(237, 23, 'description_fr', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 5),
(238, 23, 'created_at', 'timestamp', 'Date de création', 0, 1, 1, 0, 0, 1, '{}', 12),
(239, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 1, '{}', 6),
(240, 23, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 7),
(241, 23, 'titre_ar', 'text', 'العنوان', 0, 1, 1, 1, 1, 1, '{}', 8),
(242, 23, 'description_ar', 'rich_text_box', 'تقديم طلب العروض', 0, 0, 1, 1, 1, 1, '{}', 9),
(243, 23, 'titre_en', 'text', 'Title', 0, 0, 1, 1, 1, 1, '{}', 10),
(244, 23, 'description_en', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 13),
(245, 23, 'alt', 'text', 'Alt', 0, 0, 1, 1, 1, 1, '{}', 3),
(280, 8, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 19),
(281, 8, 'meta_description', 'text_area', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 20),
(282, 8, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 21),
(283, 8, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\",\"ATTENTE\":\"Attente d\'approbation\"}}', 24),
(284, 8, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"titre_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:actualites,slug\"}}', 22),
(285, 23, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 14),
(286, 23, 'meta_description', 'text_area', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 15),
(287, 23, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 16),
(288, 23, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\"}}', 17),
(289, 23, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"titre_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:appels_offres,slug\"}}', 18),
(305, 14, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 18),
(306, 14, 'meta_description', 'text_area', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 19),
(307, 14, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 20),
(308, 14, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\"}}', 21),
(309, 14, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"titre_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:evenements,slug\"}}', 22),
(320, 19, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 11),
(321, 19, 'meta_description', 'text_area', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 12),
(322, 19, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 13),
(323, 19, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\"}}', 14),
(324, 19, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"theme_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:themes,slug\"}}', 15),
(325, 20, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 11),
(326, 20, 'meta_description', 'text_area', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 12),
(327, 20, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 13),
(328, 20, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\"}}', 14),
(329, 20, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"type_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:types,slug\"}}', 15),
(335, 36, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(336, 36, 'titre_fr', 'text', 'Titre', 0, 0, 1, 1, 1, 1, '{}', 2),
(337, 36, 'titre_ar', 'text', 'عنوان الصفحة', 0, 1, 1, 1, 1, 1, '{}', 3),
(338, 36, 'titre_en', 'text', 'Title', 0, 0, 1, 1, 1, 1, '{}', 4),
(339, 36, 'contenu_fr', 'rich_text_box', 'Contenu', 0, 0, 1, 1, 1, 1, '{}', 5),
(340, 36, 'contenu_ar', 'rich_text_box', 'Contenu', 0, 0, 1, 1, 1, 1, '{}', 6),
(341, 36, 'contenu_en', 'rich_text_box', 'Contenu', 0, 0, 1, 1, 1, 1, '{}', 7),
(343, 36, 'images', 'media_picker', 'Images', 0, 0, 1, 1, 1, 1, '{\"max\":100,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 9),
(344, 36, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 10),
(345, 36, 'meta_description', 'text_area', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 11),
(346, 36, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 12),
(347, 36, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"titre_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:articles,slug\"}}', 13),
(348, 36, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Brouillon\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"DRAFT\":\"Brouillon\",\"PENDING\":\"En attendant\",\"ARCHIVE\":\"Archiv\\u00e9\"}}', 14),
(349, 36, 'featured', 'checkbox', 'Mise en avant', 0, 0, 1, 1, 1, 1, '{}', 15),
(350, 36, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 16),
(351, 36, 'created_at', 'timestamp', 'Date de création', 0, 1, 1, 0, 0, 1, '{}', 17),
(352, 36, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 1, '{}', 18),
(353, 8, 'featured', 'checkbox', 'Mise en avant', 0, 0, 1, 1, 1, 1, '{}', 23),
(354, 23, 'featured', 'checkbox', 'Mise en avant', 0, 0, 1, 1, 1, 1, '{}', 19),
(358, 13, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 11),
(359, 13, 'meta_description', 'text_area', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 12),
(360, 13, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 13),
(361, 13, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\"}}', 14),
(362, 13, 'slug', 'select_dropdown', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"seo_title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:contacts,slug\"}}', 15),
(363, 13, 'featured', 'checkbox', 'Mise en avant', 0, 0, 1, 1, 1, 1, '{}', 16),
(364, 14, 'featured', 'checkbox', 'Mise en avant', 0, 0, 1, 1, 1, 1, '{}', 23),
(367, 19, 'featured', 'checkbox', 'Mise en avant', 0, 0, 1, 1, 1, 1, '{}', 16),
(368, 20, 'featured', 'checkbox', 'Mise en avant', 0, 0, 1, 1, 1, 1, '{}', 16),
(382, 41, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(383, 41, 'titre_fr', 'text', 'Titre', 0, 0, 1, 1, 1, 1, '{}', 2),
(384, 41, 'date_debut', 'date', 'Date début', 0, 1, 1, 1, 1, 1, '{}', 4),
(385, 41, 'date_fin', 'date', 'Date fin', 0, 1, 1, 1, 1, 1, '{}', 5),
(386, 41, 'description_fr', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 6),
(387, 41, 'titre_ar', 'text', 'العنوان', 0, 1, 1, 1, 1, 1, '{}', 3),
(388, 41, 'titre_en', 'text', 'Title', 0, 0, 1, 1, 1, 1, '{}', 7),
(389, 41, 'description_ar', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 8),
(390, 41, 'description_en', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 9),
(391, 41, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 10),
(392, 41, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 11),
(393, 41, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 12),
(394, 41, 'status', 'select_dropdown', 'Status', 0, 0, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\"}}', 13),
(395, 41, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"titre_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:galleries,slug\"}}', 14),
(396, 41, 'featured', 'checkbox', 'Mise en avant', 0, 0, 1, 1, 1, 1, '{}', 15),
(397, 41, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 16),
(398, 41, 'created_at', 'timestamp', 'Date de création', 0, 1, 1, 0, 0, 1, '{}', 17),
(399, 41, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 1, '{}', 18),
(419, 44, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(420, 44, 'titre_fr', 'text', 'Titre', 0, 0, 1, 1, 1, 1, '{}', 2),
(421, 44, 'titre_ar', 'text', 'العنوان', 0, 1, 1, 1, 1, 1, '{}', 3),
(422, 44, 'titre_en', 'text', 'Title', 0, 0, 1, 1, 1, 1, '{}', 4),
(423, 44, 'lien', 'text', 'Lien', 0, 1, 1, 1, 1, 1, '{}', 5),
(424, 44, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 6),
(425, 44, 'created_at', 'timestamp', 'Date de création', 0, 0, 1, 0, 0, 1, '{}', 7),
(426, 44, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 1, '{}', 8),
(500, 50, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(501, 50, 'titre_fr', 'text', 'Titre', 0, 1, 1, 1, 1, 1, '{}', 2),
(502, 50, 'titre_ar', 'text', 'العنون', 0, 0, 1, 1, 1, 1, '{}', 3),
(503, 50, 'titre_en', 'text', 'Title', 0, 0, 1, 1, 1, 1, '{}', 4),
(504, 50, 'lien', 'text', 'Lien', 0, 1, 1, 1, 1, 1, '{}', 5),
(505, 50, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 6),
(506, 50, 'created_at', 'timestamp', 'Date de création', 0, 1, 1, 0, 0, 1, '{}', 7),
(507, 50, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 1, '{}', 8),
(509, 8, 'lien', 'text', 'Lien', 0, 0, 1, 1, 1, 1, '{}', 11),
(510, 8, 'date_publication', 'date', 'Date de publication', 0, 1, 1, 1, 1, 1, '{}', 15),
(512, 8, 'carousel', 'media_picker', 'Carrousel d\'image', 0, 0, 1, 1, 1, 1, '{\"max\":100,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 13),
(513, 41, 'Images', 'media_picker', 'Images', 0, 0, 1, 1, 1, 1, '{\"max\":100,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 19),
(514, 41, 'videos', 'media_picker', 'Videos', 0, 0, 1, 1, 1, 1, '{\"max\":100,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 20),
(528, 14, 'carousel', 'media_picker', 'Carousel', 0, 0, 1, 1, 1, 1, '{\"max\":100,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 24),
(531, 54, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(532, 54, 'photo', 'media_picker', 'Photo', 0, 1, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 2),
(536, 54, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 5),
(537, 54, 'created_at', 'timestamp', 'Date de création', 0, 1, 1, 0, 0, 1, '{}', 7),
(538, 54, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 1, '{}', 8),
(543, 54, 'texte', 'rich_text_box', 'Texte', 0, 1, 1, 1, 1, 1, '{}', 4),
(544, 54, 'langue', 'select_dropdown', 'Langue', 0, 1, 1, 1, 1, 1, '{\"default\":\"TOUS\",\"options\":{\"TOUS\":\"TOUS\",\"FR\":\"fr\",\"AR\":\"ar\",\"EN\":\"en\"}}', 6),
(552, 23, 'pieces_jointes', 'media_picker', 'Pièces Jointes', 0, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 20),
(553, 23, 'date_fin', 'date', 'Date limite', 0, 1, 1, 1, 1, 1, '{}', 11),
(573, 14, 'video', 'media_picker', 'Video', 0, 0, 1, 1, 1, 1, '{\"max\":100,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 25),
(574, 8, 'video', 'media_picker', 'Video', 0, 0, 1, 1, 1, 1, '{\"max\":100,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 14),
(601, 8, 'nv_onglet', 'select_multiple', 'Ouvrir dans', 0, 0, 1, 1, 1, 1, '{\"default\":\"M\\u00eame onglet\\/fen\\u00eatre\",\"options\":{\"_self\":\"M\\u00eame onglet\\/fen\\u00eatre\",\"_blank\":\"Nouvel onglet\\/fen\\u00eatre\"}}', 25),
(602, 50, 'nv_onglet', 'select_dropdown', 'Ouvrir dans', 0, 0, 1, 1, 1, 1, '{\"default\":\"M\\u00eame onglet\\/fen\\u00eatre\",\"options\":{\"_self\":\"M\\u00eame onglet\\/fen\\u00eatre\",\"_blank\":\"Nouvel onglet\\/fen\\u00eatre\"}}', 9),
(603, 44, 'nv_onglet', 'select_dropdown', 'Ouvrir dans', 0, 0, 1, 1, 1, 1, '{\"default\":\"M\\u00eame onglet\\/fen\\u00eatre\",\"options\":{\"_self\":\"M\\u00eame onglet\\/fen\\u00eatre\",\"_blank\":\"Nouvel onglet\\/fen\\u00eatre\"}}', 9),
(611, 60, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(612, 60, 'created_at', 'timestamp', 'Date de création', 0, 1, 1, 0, 0, 1, '{}', 2),
(613, 60, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 1, '{}', 3),
(614, 60, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 4),
(615, 60, 'Couleurs', 'hidden', 'Couleurs', 0, 0, 1, 1, 1, 1, '{}', 5),
(616, 60, 'AxeX', 'hidden', 'Axe X', 0, 0, 1, 1, 1, 1, '{}', 6),
(617, 60, 'AxeY', 'hidden', 'Axe Y', 0, 0, 1, 1, 1, 1, '{}', 7),
(618, 60, 'Titre_fr', 'text', 'Titre', 0, 1, 1, 1, 1, 1, '{}', 8),
(619, 60, 'Titre_ar', 'text', 'العنوان', 0, 0, 1, 1, 1, 1, '{}', 9),
(620, 60, 'Titre_en', 'text', 'Title', 0, 0, 1, 1, 1, 1, '{}', 10),
(621, 60, 'Description_fr', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 11),
(622, 60, 'Description_ar', 'rich_text_box', 'التقديم', 0, 0, 1, 1, 1, 1, '{}', 12),
(623, 60, 'Description_en', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 13),
(624, 60, 'Type_Stats', 'select_dropdown', 'Type Statistique', 0, 1, 1, 1, 1, 1, '{\"default\":\"Line\",\"options\":{\"line\":\"Line\",\"bar\":\"Bar\",\"pie\":\"Pie\",\"doughnut\":\"Doughnut\",\"radar\":\"Radar\"}}', 14),
(625, 60, 'seo_title', 'text', 'Seo Title', 0, 1, 1, 1, 1, 1, '{}', 15),
(626, 60, 'meta_description', 'text', 'Meta Description', 0, 1, 1, 1, 1, 1, '{}', 16),
(627, 60, 'meta_keywords', 'text', 'Meta Keywords', 0, 1, 1, 1, 1, 1, '{}', 17),
(628, 60, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"Titre_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:statistiques,slug\"}}', 18),
(629, 60, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\"}}', 19),
(630, 60, 'featured', 'text', 'Featured', 0, 1, 1, 1, 1, 1, '{}', 20),
(631, 50, 'afficher_dans', 'select_dropdown', 'Afficher Dans', 0, 1, 1, 1, 1, 1, '{\"default\":\"Top header\",\"options\":{\"top_header\":\"Top header\",\"footer\":\"Footer\",\"menu_side\":\"Menu side\"}}', 10),
(633, 50, 'ordre', 'number', 'Ordre', 0, 0, 1, 1, 1, 1, '{}', 11),
(634, 41, 'cover', 'media_picker', 'Photos de couverture', 0, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 21),
(635, 41, 'type', 'select_dropdown', 'Type', 0, 0, 1, 1, 1, 1, '{\"default\":\"Photos\",\"options\":{\"photos\":\"Photos\",\"webtv\":\"Web TV\"}}', 22),
(654, 44, 'icone', 'media_picker', 'Icone', 0, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":1,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 10),
(664, 23, 'titrepiece_fr', 'text', 'Titre pièce jointe', 0, 0, 1, 1, 1, 1, '{}', 21),
(665, 23, 'titrepiece_ar', 'text', 'اسم الوثيقة', 0, 0, 1, 1, 1, 1, '{}', 22),
(666, 23, 'titrepiece_en', 'text', 'Title of the document', 0, 0, 1, 1, 1, 1, '{}', 23),
(676, 36, 'ListStatistiques', 'hidden', 'ListStatistiques', 0, 0, 1, 1, 1, 1, '{}', 19),
(678, 44, 'color', 'color', 'Couleur', 0, 0, 1, 1, 1, 1, '{}', 11),
(679, 54, 'titre_fr', 'text', 'Titre', 0, 0, 1, 1, 1, 1, '{}', 3),
(680, 20, 'type_loi_fr', 'select_dropdown', 'Nature de texte', 0, 1, 1, 1, 1, 1, '{\"default\":\"Loi\",\"options\":{\"Loi\":\"Loi\",\"Loi d\'orientation\":\"Loi d\'orientation\",\"D\\u00e9cret\":\"D\\u00e9cret\",\"Arr\\u00eat\\u00e9\":\"Arr\\u00eat\\u00e9\",\"Circulaire\":\"Circulaire\",\"D\\u00e9cret-loi\":\"D\\u00e9cret-loi\",\"Avis\":\"Avis\",\"D\\u00e9cret Gouvernemental\":\"D\\u00e9cret Gouvernemental\",\"D\\u00e9cret Pr\\u00e9sidentiel\":\"D\\u00e9cret Pr\\u00e9sidentiel\"}}', 17),
(681, 20, 'type_loi_ar', 'select_dropdown', 'طبيعة النص', 0, 1, 1, 1, 1, 1, '{\"default\":\"\\u0642\\u0627\\u0646\\u0648\\u0646\",\"options\":{\"\\u0642\\u0627\\u0646\\u0648\\u0646\":\"\\u0642\\u0627\\u0646\\u0648\\u0646\",\"\\u0642\\u0627\\u0646\\u0648\\u0646 \\u062a\\u0648\\u062c\\u064a\\u0647\":\"\\u0642\\u0627\\u0646\\u0648\\u0646 \\u062a\\u0648\\u062c\\u064a\\u0647\",\"\\u0623\\u0645\\u0631\":\"\\u0623\\u0645\\u0631\",\"\\u0642\\u0631\\u0627\\u0631\":\"\\u0642\\u0631\\u0627\\u0631\",\"\\u0645\\u0646\\u0634\\u0648\\u0631\":\"\\u0645\\u0646\\u0634\\u0648\\u0631\",\"\\u0645\\u0631\\u0633\\u0648\\u0645\":\"\\u0645\\u0631\\u0633\\u0648\\u0645\",\"\\u0631\\u0623\\u064a\":\"\\u0631\\u0623\\u064a\",\"\\u0642\\u0631\\u0627\\u0631 \\u062d\\u0643\\u0648\\u0645\\u064a\":\"\\u0642\\u0631\\u0627\\u0631 \\u062d\\u0643\\u0648\\u0645\\u064a\",\"\\u0642\\u0631\\u0627\\u0631 \\u0631\\u0626\\u0627\\u0633\\u064a\":\"\\u0642\\u0631\\u0627\\u0631 \\u0631\\u0626\\u0627\\u0633\\u064a\"}}', 18),
(682, 20, 'type_loi_en', 'select_dropdown', 'Text type', 0, 1, 1, 1, 1, 1, '{\"default\":\"Law\",\"options\":{\"Law\":\"Law\",\"Orientation law\":\"Orientation law\",\"Decree\":\"Decree\",\"Order\":\"Order\",\"Circular\":\"Circular\",\"Decree-law\":\"Decree-law\",\"Notification\":\"Notification\",\"Governement decree\":\"Governement decree\",\"Presidential decree\":\"Presidential decree\"}}', 19),
(683, 20, 'Annee', 'text', 'Année', 0, 1, 1, 1, 1, 1, '{}', 20),
(684, 65, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(685, 65, 'titre_fr', 'text', 'Titre', 0, 1, 1, 1, 1, 1, '{}', 2),
(686, 65, 'titre_ar', 'text', 'العنوان', 0, 0, 1, 1, 1, 1, '{}', 3),
(687, 65, 'image', 'media_picker', 'Image', 0, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 4),
(688, 65, 'lien', 'text', 'Lien', 0, 1, 1, 1, 1, 1, '{}', 5),
(689, 65, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(690, 65, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(691, 65, 'titre_en', 'text', 'Title', 0, 0, 1, 1, 1, 1, '{}', 8),
(739, 8, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 24),
(740, 8, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 25),
(741, 8, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 26),
(742, 8, 'approuverLe', 'text', 'ApprouverLe', 0, 0, 1, 1, 1, 1, '{}', 27),
(743, 8, 'depublierLe', 'timestamp', 'Dépublier Le', 0, 0, 1, 1, 1, 1, '{}', 28),
(751, 23, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 24),
(752, 23, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 25),
(753, 23, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 26),
(754, 23, 'approuverLe', 'text', 'ApprouverLe', 0, 0, 1, 1, 1, 1, '{}', 27),
(755, 23, 'depublierLe', 'timestamp', 'DepublierLe', 0, 0, 1, 1, 1, 1, '{}', 28),
(756, 23, 'fichier_resultat', 'media_picker', 'Fichier Resultat', 0, 0, 1, 1, 1, 1, '{}', 29),
(757, 78, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(758, 78, 'CIN', 'text', 'N° Carte identité', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"CIN\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:citoyens,CIN\"}}', 2),
(759, 78, 'NomPrenom', 'text', 'Nom et Prénom', 1, 1, 1, 1, 1, 1, '{}', 3),
(760, 78, 'email', 'text', 'E-mail', 1, 1, 1, 1, 1, 1, '{}', 4),
(761, 78, 'Tel', 'text', 'Téléphone', 0, 1, 1, 1, 1, 1, '{}', 5),
(762, 78, 'Login', 'text', 'Login', 0, 0, 0, 1, 1, 1, '{}', 6),
(763, 78, 'password', 'text', 'Mot de passe', 0, 0, 0, 1, 1, 1, '{}', 7),
(764, 78, 'Etat', 'select_dropdown', 'Etat', 0, 1, 1, 0, 0, 1, '{\"options\":{\"0\":\"En attente\",\"1\":\"Confirm\\u00e9\",\"2\":\"Suspendu\"}}', 8),
(765, 78, 'ConfirmePar', 'text', 'Confirmé Par', 0, 0, 1, 1, 1, 1, '{}', 9),
(766, 78, 'DateInscription', 'text', 'Date Inscription', 0, 0, 1, 1, 1, 1, '{}', 10),
(767, 78, 'DateSuspension', 'text', 'Date Suspension', 0, 0, 1, 1, 1, 1, '{}', 11),
(768, 78, 'RaisonSuspension', 'text', 'Raison de Suspension', 0, 0, 1, 1, 1, 1, '{}', 12),
(769, 78, 'SuspenduPar', 'text', 'Suspendu Par', 0, 0, 1, 1, 1, 1, '{}', 13),
(770, 78, 'DateDernierCnxion', 'text', 'Date Dernier Connexion', 0, 0, 1, 0, 0, 0, '{}', 14),
(771, 78, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 15),
(772, 78, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 16),
(773, 78, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 1, 1, 1, '{}', 17),
(774, 79, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(775, 79, 'codeDemande', 'text', 'Code Demande', 1, 1, 1, 1, 1, 1, '{}', 2),
(776, 79, 'IdDemandeur', 'text', 'IdDemandeur', 1, 0, 1, 1, 1, 1, '{}', 3),
(777, 79, 'Info', 'rich_text_box', 'Info', 1, 0, 1, 1, 1, 1, '{}', 4),
(778, 79, 'ServiceConcerne', 'text', 'Service Concerne', 1, 1, 1, 1, 1, 1, '{}', 5),
(779, 79, 'ReferenceDocs', 'text', 'Référence Docs', 0, 1, 1, 1, 1, 1, '{}', 6),
(780, 79, 'Remarques', 'text', 'Remarques', 0, 0, 1, 1, 1, 1, '{}', 7),
(781, 79, 'FormeAcce', 'text', 'FormeAcce', 0, 0, 1, 1, 1, 1, '{}', 8),
(782, 79, 'DateDemande', 'text', 'Date Demande', 0, 1, 1, 1, 1, 1, '{}', 9),
(783, 79, 'EtatDemande', 'select_dropdown', 'Etat Demande', 0, 1, 1, 1, 1, 1, '{\"options\":{\"0\":\"En attente\",\"1\":\"Satisfaite\",\"2\":\"Rejet\\u00e9\"}}', 10),
(784, 79, 'PiecesJointes', 'text', 'PiecesJointes', 0, 0, 1, 1, 1, 1, '{}', 11),
(785, 79, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 12),
(786, 79, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(787, 79, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 1, 1, 1, '{}', 14),
(788, 82, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(789, 82, 'CodeReclamation', 'text', 'Code réclamation', 1, 1, 1, 0, 0, 1, '{}', 2),
(790, 82, 'Sujet', 'text', 'Sujet', 1, 1, 1, 1, 1, 1, '{}', 3),
(791, 82, 'Textmessage', 'rich_text_box', 'Message', 0, 0, 1, 1, 1, 1, '{}', 5),
(792, 82, 'IdCitoyen', 'text', 'Citoyen', 1, 0, 1, 1, 1, 1, '{}', 14),
(793, 82, 'Etat', 'select_dropdown', 'Etat', 0, 1, 1, 1, 1, 1, '{\"options\":{\"0\":\"Ouverte\",\"1\":\"Ferm\\u00e9e\"}}', 6),
(794, 82, 'DateReclamation', 'date', 'DateReclamation', 0, 1, 1, 1, 1, 1, '{}', 4),
(795, 82, 'Priorite', 'text', 'Priorite', 0, 1, 1, 1, 1, 1, '{\"options\":{\"haute\":\"Haute\",\"moyenne\":\"Moyenne\",\"faible\":\"Faible\"}}', 7),
(796, 82, 'PiecesJointes', 'file', 'PiecesJointes', 0, 0, 1, 1, 1, 1, '{}', 8),
(797, 82, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 9),
(798, 82, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(799, 82, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 1, 1, 1, '{}', 11),
(800, 82, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 12),
(801, 82, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 13),
(802, 36, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 20),
(803, 36, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 21),
(804, 36, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 22),
(805, 36, 'approuverLe', 'text', 'ApprouverLe', 0, 0, 1, 1, 1, 1, '{}', 23),
(806, 36, 'depublierLe', 'timestamp', 'DepublierLe', 0, 0, 1, 1, 1, 1, '{}', 24),
(807, 14, 'googlemaps_marker', 'text', 'Googlemaps Marker', 0, 0, 1, 1, 1, 1, '{}', 26),
(808, 14, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 27),
(809, 14, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 28),
(810, 14, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 29),
(811, 14, 'approuverLe', 'text', 'ApprouverLe', 0, 1, 1, 1, 1, 1, '{}', 30),
(812, 14, 'depublierLe', 'timestamp', 'DepublierLe', 0, 0, 1, 1, 1, 1, '{}', 31),
(823, 90, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(824, 90, 'Textmessage', 'rich_text_box', 'Texte message', 0, 0, 1, 1, 1, 1, '{}', 3),
(825, 90, 'DateEnvoie', 'text', 'Date envoie', 0, 1, 1, 1, 1, 1, '{}', 4),
(826, 90, 'Sujet', 'text', 'Sujet', 0, 1, 1, 1, 1, 1, '{}', 5),
(827, 90, 'Expediteur', 'text', 'Expediteur', 0, 1, 1, 1, 1, 1, '{}', 2),
(828, 90, 'Lu', 'text', 'Lu', 0, 0, 1, 1, 1, 1, '{}', 6),
(829, 90, 'PiecesJointes', 'text', 'PiecesJointes', 0, 0, 1, 1, 1, 1, '{}', 7),
(830, 90, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 8),
(831, 90, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(832, 90, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 1, 1, 1, '{}', 10),
(833, 90, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 11),
(834, 90, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 12),
(845, 60, 'creerPar', 'text', 'CreerPar', 0, 1, 1, 1, 1, 1, '{}', 21),
(846, 60, 'modifierPar', 'text', 'ModifierPar', 0, 1, 1, 1, 1, 1, '{}', 22),
(847, 60, 'approuverPar', 'text', 'ApprouverPar', 0, 1, 1, 1, 1, 1, '{}', 23),
(848, 60, 'approuverLe', 'text', 'ApprouverLe', 0, 1, 1, 1, 1, 1, '{}', 24),
(849, 60, 'depublierLe', 'timestamp', 'DepublierLe', 0, 1, 1, 1, 1, 1, '{}', 25),
(850, 41, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 23),
(851, 41, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 24),
(852, 41, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 25),
(853, 41, 'approuverLe', 'text', 'ApprouverLe', 0, 0, 1, 1, 1, 1, '{}', 26),
(854, 41, 'depublierLe', 'timestamp', 'DepublierLe', 0, 0, 1, 1, 1, 1, '{}', 27),
(855, 13, 'service_ar', 'text', 'Service Ar', 0, 0, 1, 1, 1, 1, '{}', 17),
(856, 13, 'service_fr', 'text', 'Service', 0, 1, 1, 1, 1, 1, '{}', 18),
(857, 13, 'service_en', 'text', 'Service', 0, 0, 1, 1, 1, 1, '{}', 19),
(858, 13, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 20),
(859, 13, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 21),
(860, 13, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 22),
(861, 13, 'approuverLe', 'text', 'ApprouverLe', 0, 0, 1, 1, 1, 1, '{}', 23),
(862, 13, 'depublierLe', 'timestamp', 'DepublierLe', 0, 0, 1, 1, 1, 1, '{}', 24),
(863, 54, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 9),
(864, 54, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 10),
(865, 54, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 11),
(866, 54, 'approuverLe', 'text', 'ApprouverLe', 0, 0, 1, 1, 1, 1, '{}', 12),
(867, 54, 'depublierLe', 'timestamp', 'Depublier Le', 0, 0, 1, 1, 1, 1, '{}', 13),
(868, 54, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\",\"ATTENTE\":\"Attente d\'approbation\"}}', 14),
(869, 78, 'modifierPar', 'text', 'Modifier Par', 0, 0, 1, 1, 1, 1, '{}', 18),
(870, 78, 'creerPar', 'text', 'Créer Par', 0, 0, 1, 1, 1, 1, '{}', 19),
(871, 79, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 15),
(872, 79, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 16),
(873, 44, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 12),
(874, 44, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 13),
(875, 44, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 14),
(876, 44, 'approuverLe', 'text', 'ApprouverLe', 0, 0, 1, 1, 1, 1, '{}', 15),
(877, 44, 'depublierLe', 'timestamp', 'DepublierLe', 0, 0, 1, 1, 1, 1, '{}', 16),
(878, 44, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\",\"ATTENTE\":\"Attente d\'approbation\"}}', 17),
(879, 50, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 12),
(880, 50, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 13),
(881, 50, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 14),
(882, 50, 'approuverLe', 'text', 'ApprouverLe', 0, 0, 1, 1, 1, 1, '{}', 15),
(883, 50, 'depublierLe', 'timestamp', 'DepublierLe', 0, 0, 1, 1, 1, 1, '{}', 16),
(884, 50, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\",\"ATTENTE\":\"Attente d\'approbation\"}}', 17),
(885, 65, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 9),
(886, 65, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 10),
(887, 65, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 11),
(888, 65, 'approuverLe', 'text', 'ApprouverLe', 0, 0, 1, 1, 1, 1, '{}', 12),
(889, 65, 'depublierLe', 'timestamp', 'DepublierLe', 0, 0, 1, 1, 1, 1, '{}', 13),
(890, 65, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\",\"ATTENTE\":\"Attente d\'approbation\"}}', 14),
(891, 20, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 21),
(892, 20, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 22),
(893, 20, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 23),
(894, 20, 'approuverLe', 'text', 'ApprouverLe', 0, 0, 1, 1, 1, 1, '{}', 24),
(895, 20, 'depublierLe', 'timestamp', 'DepublierLe', 0, 0, 1, 1, 1, 1, '{}', 25),
(896, 19, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 17),
(897, 19, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 18),
(898, 19, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 19),
(899, 19, 'approuverLe', 'text', 'ApprouverLe', 0, 0, 1, 1, 1, 1, '{}', 20),
(900, 19, 'depublierLe', 'timestamp', 'DepublierLe', 0, 0, 1, 1, 1, 1, '{}', 21),
(930, 98, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(931, 98, 'titre_fr', 'text', 'Titre', 0, 0, 1, 1, 1, 1, '{}', 2),
(932, 98, 'titre_ar', 'text', 'العنوان', 0, 1, 1, 1, 1, 1, '{}', 3),
(933, 98, 'titre_en', 'text', 'Title', 0, 0, 1, 1, 1, 1, '{}', 4),
(934, 98, 'description_fr', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 5),
(935, 98, 'description_ar', 'rich_text_box', 'الوصف', 0, 0, 1, 1, 1, 1, '{}', 6),
(936, 98, 'description_en', 'rich_text_box', 'Description', 0, 0, 1, 1, 1, 1, '{}', 7),
(937, 98, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 8),
(938, 98, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 9),
(939, 98, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 10),
(940, 98, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\",\"ATTENTE\":\"Attente d\'approbation\"}}', 11),
(941, 98, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"titre_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:pub-recherches,slug\"}}', 12),
(942, 98, 'featured', 'text', 'Featured', 0, 0, 1, 1, 1, 1, '{}', 13),
(943, 98, 'Fichier', 'media_picker', 'Fichier', 0, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 14),
(944, 98, 'vignette', 'media_picker', 'Vignette', 0, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"allowed\":[\"image\",\"audio\",\"video\"],\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 15),
(945, 98, 'creerPar', 'text', 'Créer Par', 0, 0, 1, 1, 1, 1, '{}', 16),
(946, 98, 'modifierPar', 'text', 'Modifier Par', 0, 0, 1, 1, 1, 1, '{}', 17),
(947, 98, 'approuverPar', 'text', 'Approuver Par', 0, 0, 1, 1, 1, 1, '{}', 18),
(948, 98, 'approuverLe', 'text', 'Approuver Le', 0, 0, 1, 1, 1, 1, '{}', 19),
(949, 98, 'depublierLe', 'timestamp', 'Dépublier Le', 0, 0, 1, 1, 1, 1, '{}', 20),
(950, 98, 'created_at', 'timestamp', 'Date de création', 0, 1, 1, 1, 0, 1, '{}', 21),
(951, 98, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 22),
(952, 99, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(954, 99, 'date_demande', 'text', 'Date Demande', 0, 1, 1, 1, 1, 1, '{}', 4),
(955, 99, 'etat', 'select_dropdown', 'Etat', 0, 1, 1, 1, 1, 1, '{\"options\":{\"0\":\"En cours de traitement\",\"1\":\"Livr\\u00e9e\",\"2\":\"Refus\\u00e9e\"}}', 5),
(956, 99, 'raison_refus', 'text', 'Raison Refus', 0, 0, 1, 1, 1, 1, '{}', 6),
(959, 99, 'langue', 'select_dropdown', 'Langue', 0, 1, 1, 1, 1, 1, '{\"options\":{\"ar\":\"Arabe\",\"fr\":\"Fran\\u00e7ais\"}}', 7),
(960, 99, 'traiter_par', 'text', 'Traiter Par', 0, 0, 1, 1, 1, 1, '{}', 8),
(961, 99, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 1, 1, 1, '{}', 9),
(962, 99, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 10),
(963, 99, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(964, 99, 'citoyen_id', 'select_dropdown', 'Citoyen Id', 0, 0, 1, 1, 1, 1, '{\"relationship\":{\"key\":\"id\",\"label\":\"NomPrenom\"}}', 2),
(965, 100, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(966, 100, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 2),
(967, 100, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(968, 100, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 1, 0, 0, 1, '{}', 4),
(969, 100, 'libelle', 'text', 'Libelle', 0, 1, 1, 1, 1, 1, '{}', 5),
(970, 100, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 6),
(971, 99, 'description', 'text', 'Description', 0, 0, 1, 1, 1, 1, '{}', 12),
(972, 99, 'type_docs_id', 'text', 'Type Docs Id', 0, 0, 1, 1, 1, 1, '{}', 14),
(973, 99, 'type_envoi', 'select_dropdown', 'Type d\'envoi', 0, 1, 1, 1, 1, 1, '{\"options\":{\"0\":\"Par poste\",\"1\":\"Par e-mail\",\"2\":\"A travers le minist\\u00e8re\"}}', 11),
(987, 104, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(988, 104, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 2),
(989, 104, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(990, 104, 'titre_fr', 'text', 'Titre Fr', 0, 1, 1, 1, 1, 1, '{}', 4),
(991, 104, 'position', 'text', 'Position', 0, 1, 1, 1, 1, 1, '{}', 5),
(992, 104, 'lien_view', 'select_dropdown', 'Lien View', 0, 1, 1, 1, 1, 1, '{\"default\":\"\\u0627\\u0644\\u0623\\u062e\\u0628\\u0627\\u0631 \\u0648 \\u0627\\u0644\\u0628\\u0644\\u0627\\u063a\\u0627\\u062a\",\"options\":{\"Lien1\":\"\\u0627\\u0644\\u0623\\u062e\\u0628\\u0627\\u0631 \\u0648 \\u0627\\u0644\\u0628\\u0644\\u0627\\u063a\\u0627\\u062a\",\"Lien2\":\"\\u0646\\u062f\\u0648\\u0627\\u062a \\u0648\\u0645\\u0644\\u062a\\u0642\\u064a\\u0627\\u062a\",\"Lien3\":\"\\u0627\\u0644\\u062a\\u0631\\u0634\\u062d \\u0644\\u0627\\u062f\\u0627\\u0621 \\u0645\\u0646\\u0627\\u0633\\u0643 \\u0627\\u0644\\u062d\\u062c\",\"Lien4\":\"\\u0623\\u0648\\u0642\\u0627\\u062a \\u0627\\u0644\\u0635\\u0644\\u0627\\u0629\",\"Lien5\":\"\\u0645\\u0635\\u062d\\u0641 \\u0627\\u0644\\u062c\\u0645\\u0647\\u0648\\u0631\\u064a\\u0629\",\"Lien6\":\"\\u0635\\u0646\\u062f\\u0648\\u0642 \\u0627\\u0644\\u0645\\u0639\\u0627\\u0644\\u0645\",\"Lien7\":\"\\u0625\\u062d\\u0635\\u0627\\u0626\\u064a\\u0627\\u062a\",\"Lien8\":\"\\u0645\\u0633\\u0627\\u062c\\u062f \\u062a\\u0648\\u0646\\u0633\\u064a\\u0629\"}}', 6),
(993, 104, 'contenu_specifique_fr', 'rich_text_box', 'Contenu Specifique Fr', 0, 1, 1, 1, 1, 1, '{}', 7),
(994, 104, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 8),
(995, 104, 'titre_en', 'text', 'Titre En', 0, 1, 1, 1, 1, 1, '{}', 9),
(996, 104, 'titre_ar', 'text', 'Titre Ar', 0, 1, 1, 1, 1, 1, '{}', 10),
(997, 104, 'contenu_specifique_en', 'rich_text_box', 'Contenu Specifique En', 0, 1, 1, 1, 1, 1, '{}', 11),
(998, 104, 'contenu_specifique_ar', 'rich_text_box', 'Contenu Specifique Ar', 0, 1, 1, 1, 1, 1, '{}', 12),
(999, 104, 'type', 'select_dropdown', 'Type', 0, 1, 1, 1, 1, 1, '{\"default\":\"Module\",\"options\":{\"1\":\"Module\",\"2\":\"Texte riche\",\"3\":\"Raccourci rapide\"}}', 13),
(1000, 104, 'raccourci_rapideId', 'text', 'Raccourci RapideId', 0, 1, 1, 1, 1, 1, '{}', 14),
(1001, 104, 'accueil_composant_belongsto_raccourci_rapide_relationship', 'relationship', 'raccourci_rapides', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\RaccourciRapide\",\"table\":\"raccourci_rapides\",\"type\":\"belongsTo\",\"column\":\"raccourci_rapideId\",\"key\":\"id\",\"label\":\"titre_ar\",\"pivot_table\":\"accueil_composants\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(1049, 78, 'TypeCompte', 'text', 'TypeCompte', 0, 1, 1, 1, 1, 1, '{}', 20),
(1050, 90, 'id_citoyen', 'text', 'Id Citoyen', 0, 0, 1, 1, 1, 1, '{}', 13),
(1051, 99, 'libelle_type_doc', 'text', 'Document Demandé', 0, 1, 1, 1, 1, 1, '{}', 3),
(1052, 108, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(1053, 108, 'type_personne', 'text', 'Type Personne', 0, 0, 1, 1, 1, 1, '{}', 6),
(1054, 108, 'raison_sociale', 'text', 'Raison Sociale', 0, 1, 1, 1, 1, 1, '{}', 2),
(1055, 108, 'adresse', 'text', 'Adresse', 0, 0, 1, 1, 1, 1, '{}', 7),
(1056, 108, 'tel', 'text', 'Tel', 0, 0, 1, 1, 1, 1, '{}', 8),
(1057, 108, 'email', 'text', 'Email', 0, 0, 1, 1, 1, 1, '{}', 9),
(1058, 108, 'identifie', 'text', 'Identifie', 0, 0, 1, 1, 1, 1, '{}', 10),
(1059, 108, 'structure_signale', 'text', 'Structure Signale', 0, 1, 1, 1, 1, 1, '{}', 11),
(1060, 108, 'secteur', 'text', 'Secteur', 0, 0, 1, 1, 1, 1, '{}', 12),
(1061, 108, 'description', 'text', 'Description', 0, 0, 1, 1, 1, 1, '{}', 13),
(1062, 108, 'PiecesJointes', 'text', 'PiecesJointes', 0, 0, 1, 1, 1, 1, '{}', 14);
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1063, 108, 'Nom', 'text', 'Nom', 0, 1, 1, 1, 1, 1, '{}', 3),
(1064, 108, 'Prenom', 'text', 'Prénom', 0, 1, 1, 1, 1, 1, '{}', 4),
(1065, 108, 'CIN', 'text', 'CIN', 0, 0, 1, 1, 1, 1, '{}', 15),
(1066, 108, 'TrancheAge', 'text', 'TrancheAge', 0, 0, 1, 1, 1, 1, '{}', 16),
(1067, 108, 'Sexe', 'text', 'Sexe', 0, 0, 1, 1, 1, 1, '{}', 17),
(1068, 108, 'Profession', 'text', 'Profession', 0, 0, 1, 1, 1, 1, '{}', 18),
(1069, 108, 'Gouvernorat', 'text', 'Gouvernorat', 0, 0, 1, 1, 1, 1, '{}', 19),
(1070, 108, 'personne_signale', 'text', 'Personne Signale', 0, 0, 1, 1, 1, 1, '{}', 20),
(1071, 108, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(1072, 108, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 21),
(1073, 108, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 22),
(1074, 108, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 23),
(1075, 98, 'DatePublication', 'date', 'DatePublication', 0, 1, 1, 1, 1, 1, '{}', 23),
(1076, 109, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(1077, 109, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 2),
(1078, 109, 'created_at', 'timestamp', 'Date inscription', 0, 1, 1, 1, 0, 1, '{}', 3),
(1079, 109, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(1080, 109, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Actif\",\"options\":{\"ACTIF\":\"Actif\",\"SUSPENDU\":\"Suspendu\"}}', 5),
(1081, 110, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(1082, 110, 'TextMessage', 'rich_text_box', 'TextMessage', 0, 0, 1, 1, 1, 1, '{}', 3),
(1083, 110, 'status', 'select_dropdown', 'Status', 0, 1, 1, 0, 1, 1, '{\"default\":\"En cours d\'envoie\",\"options\":{\"0\":\"En cours d\'envoie\",\"1\":\"Envoy\\u00e9\"}}', 4),
(1084, 110, 'created_at', 'timestamp', 'Date création', 0, 1, 1, 1, 0, 1, '{}', 5),
(1085, 110, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(1086, 110, 'Sujet', 'text', 'Sujet', 0, 1, 1, 1, 1, 1, '{}', 2),
(1087, 110, 'creerPar', 'text', 'CreerPar', 0, 0, 1, 1, 1, 1, '{}', 7),
(1088, 110, 'modifierPar', 'text', 'ModifierPar', 0, 0, 1, 1, 1, 1, '{}', 8),
(1089, 110, 'approuverPar', 'text', 'ApprouverPar', 0, 0, 1, 1, 1, 1, '{}', 9),
(1090, 110, 'approuverLe', 'text', 'ApprouverLe', 0, 0, 1, 1, 1, 1, '{}', 10),
(1091, 41, 'youtube', 'text', 'Youtube', 0, 1, 1, 1, 1, 1, '{}', 28),
(1092, 41, 'lienyoutube', 'text', 'Lienyoutube', 0, 1, 1, 1, 1, 1, '{}', 29),
(1093, 111, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(1094, 111, 'adresse_fr', 'text', 'Adresse Fr', 0, 1, 1, 1, 1, 1, '{}', 2),
(1095, 111, 'adresse_ar', 'text', 'Adresse Ar', 0, 1, 1, 1, 1, 1, '{}', 3),
(1096, 111, 'adresse_en', 'text', 'Adresse En', 0, 1, 1, 1, 1, 1, '{}', 4),
(1097, 111, 'tel', 'text', 'Tel', 0, 1, 1, 1, 1, 1, '{}', 5),
(1098, 111, 'fax', 'text', 'Fax', 0, 1, 1, 1, 1, 1, '{}', 6),
(1099, 111, 'E_mail', 'text', 'E Mail', 0, 1, 1, 1, 1, 1, '{}', 7),
(1100, 111, 'description_fr', 'text', 'Description Fr', 0, 1, 1, 1, 1, 1, '{}', 8),
(1101, 111, 'description_ar', 'text', 'Description Ar', 0, 1, 1, 1, 1, 1, '{}', 9),
(1102, 111, 'description_en', 'text', 'Description En', 0, 1, 1, 1, 1, 1, '{}', 10),
(1103, 111, 'libelle_fr', 'text', 'Libelle Fr', 0, 1, 1, 1, 1, 1, '{}', 11),
(1104, 111, 'libelle_en', 'text', 'Libelle En', 0, 1, 1, 1, 1, 1, '{}', 12),
(1105, 111, 'libelle_ar', 'text', 'Libelle Ar', 0, 1, 1, 1, 1, 1, '{}', 13),
(1106, 111, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 14),
(1107, 111, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(1108, 111, 'seo_title', 'text', 'Seo Title', 0, 1, 1, 1, 1, 1, '{}', 16),
(1109, 111, 'meta_description', 'text', 'Meta Description', 0, 1, 1, 1, 1, 1, '{}', 17),
(1110, 111, 'meta_keywords', 'text', 'Meta Keywords', 0, 1, 1, 1, 1, 1, '{}', 18),
(1111, 111, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 19),
(1112, 111, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{}', 20),
(1113, 111, 'featured', 'text', 'Featured', 0, 1, 1, 1, 1, 1, '{}', 21),
(1114, 111, 'creerPar', 'text', 'CreerPar', 0, 1, 1, 1, 1, 1, '{}', 22),
(1115, 111, 'modifierPar', 'text', 'ModifierPar', 0, 1, 1, 1, 1, 1, '{}', 23),
(1116, 111, 'approuverPar', 'text', 'ApprouverPar', 0, 1, 1, 1, 1, 1, '{}', 24),
(1117, 111, 'approuverLe', 'text', 'ApprouverLe', 0, 1, 1, 1, 1, 1, '{}', 25),
(1118, 111, 'depublierLe', 'text', 'DepublierLe', 0, 1, 1, 1, 1, 1, '{}', 26),
(1119, 111, 'googlemaps_marker', 'text', 'Googlemaps Marker', 0, 1, 1, 1, 1, 1, '{}', 27),
(1120, 112, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(1121, 112, 'titre_fr', 'text', 'Titre Fr', 0, 1, 1, 1, 1, 1, '{}', 2),
(1122, 112, 'vignette', 'text', 'Vignette', 0, 1, 1, 1, 1, 1, '{}', 3),
(1123, 112, 'description_fr', 'text', 'Description Fr', 0, 1, 1, 1, 1, 1, '{}', 4),
(1124, 112, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(1125, 112, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(1126, 112, 'deleted_at', 'timestamp', 'Deleted At', 0, 1, 1, 1, 1, 1, '{}', 7),
(1127, 112, 'titre_ar', 'text', 'Titre Ar', 0, 1, 1, 1, 1, 1, '{}', 8),
(1128, 112, 'description_ar', 'text', 'Description Ar', 0, 1, 1, 1, 1, 1, '{}', 9),
(1129, 112, 'titre_en', 'text', 'Titre En', 0, 1, 1, 1, 1, 1, '{}', 10),
(1130, 112, 'description_en', 'text', 'Description En', 0, 1, 1, 1, 1, 1, '{}', 11),
(1131, 112, 'alt', 'text', 'Alt', 0, 1, 1, 1, 1, 1, '{}', 12),
(1132, 112, 'seo_title', 'text', 'Seo Title', 0, 1, 1, 1, 1, 1, '{}', 13),
(1133, 112, 'meta_description', 'text', 'Meta Description', 0, 1, 1, 1, 1, 1, '{}', 14),
(1134, 112, 'meta_keywords', 'text', 'Meta Keywords', 0, 1, 1, 1, 1, 1, '{}', 15),
(1135, 112, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 16),
(1136, 112, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{}', 17),
(1137, 112, 'featured', 'text', 'Featured', 0, 1, 1, 1, 1, 1, '{}', 18),
(1138, 112, 'carousel', 'text', 'Carousel', 0, 1, 1, 1, 1, 1, '{}', 19),
(1139, 112, 'creerPar', 'text', 'CreerPar', 0, 1, 1, 1, 1, 1, '{}', 20),
(1140, 112, 'modifierPar', 'text', 'ModifierPar', 0, 1, 1, 1, 1, 1, '{}', 21),
(1141, 112, 'approuverPar', 'text', 'ApprouverPar', 0, 1, 1, 1, 1, 1, '{}', 22),
(1142, 112, 'approuverLe', 'text', 'ApprouverLe', 0, 1, 1, 1, 1, 1, '{}', 23),
(1143, 112, 'DateCooperation', 'text', 'DateCooperation', 0, 1, 1, 1, 1, 1, '{}', 24),
(1144, 116, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(1145, 116, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 13),
(1146, 116, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 2),
(1147, 116, 'Annee', 'text', 'Année', 0, 1, 1, 1, 1, 1, '{}', 3),
(1148, 116, 'titre_ar', 'text', 'العنوان', 0, 1, 1, 1, 1, 1, '{}', 4),
(1149, 116, 'titre_fr', 'text', 'Titre', 0, 0, 1, 1, 1, 1, '{}', 5),
(1150, 116, 'TypeBudget', 'select_dropdown', 'Type de document', 0, 1, 1, 1, 1, 1, '{\"default\":\"\\u0627\\u0644\\u062a\\u0634\\u062e\\u064a\\u0635 \\u0627\\u0644\\u0641\\u0646\\u064a \\u0648 \\u0627\\u0644\\u0645\\u0627\\u0644\\u064a\",\"options\":{\"DIAGNOSTIQUE_TECH_FINANCIER\":\"\\u0627\\u0644\\u062a\\u0634\\u062e\\u064a\\u0635 \\u0627\\u0644\\u0641\\u0646\\u064a \\u0648 \\u0627\\u0644\\u0645\\u0627\\u0644\\u064a\",\"ELABORATION_PROGRAMME\":\"\\u0625\\u0639\\u062f\\u0627\\u062f \\u0627\\u0644\\u0628\\u0631\\u0646\\u0627\\u0645\\u062c \\u0627\\u0644\\u062a\\u0634\\u0627\\u0631\\u0643\\u064a\",\"BUDGET_PARTICIPATIF\":\"\\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u0646\\u064a\\u0629 \\u0627\\u0644\\u062a\\u0634\\u0627\\u0631\\u0643\\u064a\\u0629\",\"COMMISSION_PAR_ARRONDISSEMENT\":\"\\u0627\\u0644\\u062c\\u0644\\u0633\\u0627\\u062a \\u0627\\u0644\\u062a\\u0634\\u0627\\u0631\\u0643\\u064a\\u0629 \\u0628\\u0627\\u0644\\u0645\\u0646\\u0627\\u0637\\u0642\",\"COMMISIONS_PARTICIPATIFS\":\"\\u0627\\u0644\\u062c\\u0644\\u0633\\u0627\\u062a \\u0627\\u0644\\u062a\\u0634\\u0627\\u0631\\u0643\\u064a\\u0629\"}}', 6),
(1151, 116, 'Document', 'media_picker', 'Document', 0, 1, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 7),
(1152, 116, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 8),
(1153, 116, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 9),
(1154, 116, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 10),
(1155, 116, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"titre_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:budget_partcipatifs,slug\"}}', 11),
(1156, 116, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\",\"ATTENTE\":\"Attente d\'approbation\"}}', 12),
(1157, 117, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(1158, 117, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 2),
(1159, 117, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(1160, 117, 'Annee', 'text', 'Année', 0, 1, 1, 1, 1, 1, '{}', 4),
(1161, 117, 'titre_ar', 'text', 'العنوان', 0, 0, 1, 1, 1, 1, '{}', 5),
(1162, 117, 'titre_fr', 'text', 'Titre', 0, 1, 1, 1, 1, 1, '{}', 6),
(1163, 117, 'TitreEN', 'text', 'TitreEN', 0, 0, 1, 1, 1, 1, '{}', 7),
(1164, 117, 'TypeConseil', 'select_dropdown', 'Type Conseil', 0, 1, 1, 1, 1, 1, '{\"default\":\"\\u062a\\u0645\\u0647\\u064a\\u062f\\u064a\\u0629\",\"options\":{\"PREP\":\"\\u062a\\u0645\\u0647\\u064a\\u062f\\u064a\\u0629\",\"ORDINAIRE\":\"\\u0639\\u0627\\u062f\\u064a\\u0629\",\"EXTRA\":\"\\u0625\\u0633\\u062a\\u062b\\u0646\\u0627\\u0626\\u064a\\u0629\",\"GENERAL\":\"\\u0639\\u0627\\u0645\\u0629\"}}', 8),
(1165, 117, 'FichierConseil', 'media_picker', 'Fichier', 0, 1, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 10),
(1166, 117, 'seo_title', 'text', 'Seo Title', 0, 1, 1, 1, 1, 1, '{}', 11),
(1167, 117, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 12),
(1168, 117, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 13),
(1169, 117, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"titre_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:conseil_municipales,slug\"},\"messages\":{\"unique\":\"This :attribute field is a must.\"}}', 14),
(1170, 117, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\",\"ATTENTE\":\"Attente d\'approbation\"}}', 15),
(1171, 118, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(1172, 118, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 13),
(1173, 118, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 2),
(1174, 118, 'Annee', 'text', 'Annee', 0, 1, 1, 1, 1, 1, '{}', 3),
(1175, 118, 'titre_ar', 'text', 'أسم الوثيقة', 0, 1, 1, 1, 1, 1, '{}', 4),
(1176, 118, 'titre_fr', 'text', 'Titre', 0, 0, 1, 1, 1, 1, '{}', 5),
(1177, 118, 'TypeFinance', 'select_dropdown', 'Type de document', 0, 1, 1, 1, 1, 1, '{\"default\":\"\\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u0646\\u064a\\u0629\",\"options\":{\"BUDGET\":\"\\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u0646\\u064a\\u0629\",\"COMPTEFINANCIER\":\"\\u0627\\u0644\\u062d\\u0633\\u0627\\u0628\\u0627\\u062a \\u0627\\u0644\\u0645\\u0627\\u0644\\u064a\\u0629\",\"DETTES\":\"\\u0627\\u0644\\u062f\\u064a\\u0648\\u0646\",\"RECOUVREMENT\":\"\\u0627\\u0644\\u062a\\u063a\\u0637\\u064a\\u0629\",\"RESULTATPERFO\":\"\\u0646\\u062a\\u0627\\u0626\\u062c \\u062a\\u0642\\u064a\\u064a\\u0645 \\u0627\\u0644\\u0623\\u062f\\u0627\\u0621\",\"PLANAPPELOFFRES\":\"\\u062c\\u062f\\u0648\\u0644 \\u0642\\u064a\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0635\\u0641\\u0642\\u0627\\u062a \\u0627\\u0644\\u0639\\u0645\\u0648\\u0645\\u064a\\u0629\"}}', 6),
(1178, 118, 'FichierFinance', 'media_picker', 'Document', 0, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 7),
(1179, 118, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 8),
(1180, 118, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 9),
(1181, 118, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 10),
(1182, 118, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"titre_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:finances,slug\"}}', 11),
(1183, 118, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\"}}', 12),
(1184, 119, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(1185, 119, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 13),
(1186, 119, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 2),
(1187, 119, 'Annee', 'text', 'Année', 0, 1, 1, 1, 1, 1, '{}', 3),
(1188, 119, 'titre_ar', 'text', 'إسم الوثيقة', 0, 1, 1, 1, 1, 1, '{}', 4),
(1189, 119, 'titre_fr', 'text', 'Titre', 0, 0, 1, 1, 1, 1, '{}', 5),
(1190, 119, 'TypeProjet', 'text', 'Type de document', 0, 1, 1, 1, 1, 1, '{\"default\":\"\\u0645\\u0634\\u0627\\u0631\\u064a\\u0639 \\u062f\\u0627\\u062e\\u0644 \\u0628\\u0631\\u0646\\u0627\\u0645\\u062c \\u0627\\u0644\\u0625\\u0633\\u062a\\u062b\\u0645\\u0627\\u0631 \\u0627\\u0644\\u0628\\u0644\\u062f\\u064a\",\"options\":{\"PROJETDANSPIC\":\"\\u0645\\u0634\\u0627\\u0631\\u064a\\u0639 \\u062f\\u0627\\u062e\\u0644 \\u0628\\u0631\\u0646\\u0627\\u0645\\u062c \\u0627\\u0644\\u0625\\u0633\\u062a\\u062b\\u0645\\u0627\\u0631 \\u0627\\u0644\\u0628\\u0644\\u062f\\u064a\",\"PROJETHORSPIC\":\"\\u0645\\u0634\\u0627\\u0631\\u064a\\u0639 \\u062e\\u0627\\u0631\\u062c \\u0628\\u0631\\u0646\\u0627\\u0645\\u062c \\u0627\\u0644\\u0625\\u0633\\u062a\\u062b\\u0645\\u0627\\u0631 \\u0627\\u0644\\u0628\\u0644\\u062f\\u064a\",\"PLANINVESTISSEMENT\":\"\\u0645\\u062e\\u0637\\u0637 \\u0627\\u0644\\u0625\\u0633\\u062a\\u062b\\u0645\\u0627\\u0631 \\u0627\\u0644\\u0633\\u0646\\u0648\\u064a\",\"EVALUATIONREALISATION\":\"\\u062a\\u0642\\u064a\\u064a\\u0645 \\u062a\\u0642\\u062f\\u0645 \\u0627\\u0644\\u0645\\u0634\\u0627\\u0631\\u064a\\u0639\"}}', 6),
(1191, 119, 'Document', 'media_picker', 'Document', 0, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 7),
(1192, 119, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 8),
(1193, 119, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 9),
(1194, 119, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 10),
(1195, 119, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"titre_fr\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:projets_realisations,slug\"}}', 11),
(1196, 119, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\"}}', 12),
(1209, 125, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(1210, 125, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 17),
(1211, 125, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 2),
(1212, 125, 'titre_fr', 'text', 'Titre', 0, 1, 1, 1, 1, 1, '{}', 3),
(1213, 125, 'description_fr', 'rich_text_box', 'Description Fr', 0, 0, 1, 1, 1, 1, '{}', 4),
(1214, 125, 'titre_ar', 'text', 'العنوان', 0, 0, 1, 1, 1, 1, '{}', 5),
(1215, 125, 'description_ar', 'rich_text_box', 'التقديم', 0, 0, 1, 1, 1, 1, '{}', 6),
(1216, 125, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 7),
(1217, 125, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 8),
(1218, 125, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 9),
(1219, 125, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\"}}', 14),
(1220, 125, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"nomAssociation\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:actualites,slug\"}}', 10),
(1221, 125, 'featured', 'text', 'Featured', 0, 0, 1, 1, 1, 1, '{}', 11),
(1222, 125, 'date_publication', 'date', 'Date Publication', 0, 0, 1, 1, 1, 1, '{}', 12),
(1223, 125, 'lienDocument', 'media_picker', 'LienDocument', 0, 0, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 15),
(1224, 125, 'nomAssociation', 'text', 'Nom Association', 0, 1, 1, 1, 1, 1, '{}', 13),
(1225, 126, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(1226, 126, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 12),
(1227, 126, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 2),
(1228, 126, 'Annee', 'text', 'Année', 0, 1, 1, 1, 1, 1, '{}', 3),
(1229, 126, 'TitreAR', 'text', 'اسم الوثيقة', 0, 1, 1, 1, 1, 1, '{}', 4),
(1230, 126, 'Document', 'media_picker', 'Document', 0, 1, 1, 1, 1, 1, '{\"max\":1,\"min\":0,\"expanded\":false,\"base_path\":\"\\/\",\"show_folders\":true,\"show_toolbar\":true,\"allow_upload\":true,\"allow_move\":true,\"allow_delete\":true,\"allow_create_folder\":true,\"allow_rename\":true,\"allow_crop\":true,\"hide_thumbnails\":false,\"quality\":90,\"watermark\":{\"source\":\"...\",\"position\":\"top-left\",\"x\":0,\"y\":0}}', 5),
(1231, 126, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 6),
(1232, 126, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 7),
(1233, 126, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 8),
(1234, 126, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"TitreFR\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:protection_socio_enviros,slug\"}}', 9),
(1235, 126, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"Publi\\u00e9\",\"options\":{\"PUBLISHED\":\"Publi\\u00e9\",\"UNPUBLISHED\":\"D\\u00e9publi\\u00e9\",\"ARCHIVE\":\"Archiv\\u00e9\"}}', 10),
(1236, 126, 'TitreFR', 'text', 'TitreFR', 0, 0, 1, 1, 1, 1, '{}', 11),
(1237, 125, 'nomAssociation_ar', 'text', 'اسم الجمعية', 0, 0, 1, 1, 1, 1, '{}', 16),
(1238, 117, 'date_publication', 'date', 'Date Publication', 0, 1, 1, 1, 1, 1, '{}', 9);

-- --------------------------------------------------------

--
-- Structure de la table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-07-23 04:29:11', '2019-07-23 04:29:11'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-07-23 04:29:11', '2019-08-24 07:08:55'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-07-23 04:29:11', '2019-07-23 04:29:11'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2019-07-23 04:29:36', '2019-07-23 04:29:36'),
(8, 'actualites', 'actualites', 'Actualité', 'Actualités', 'voyager-news', 'App\\Actualite', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-07-24 06:15:52', '2020-08-12 11:40:15'),
(13, 'contacts', 'contacts', 'Page contact', 'Contacts', 'voyager-telephone', 'App\\Contact', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-08-01 04:26:33', '2020-03-19 03:34:54'),
(14, 'evenements', 'evenements', 'Événement', 'Événements', 'voyager-calendar', 'App\\Evenement', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-01 05:04:06', '2020-06-12 10:17:11'),
(19, 'themes', 'themes', 'Texte juridique', 'Texte juridique', 'voyager-file-text', 'App\\Theme', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-08-01 06:11:41', '2020-03-19 03:40:34'),
(20, 'types', 'types', 'Texte juridique', 'Texte juridique', 'voyager-file-text', 'App\\Type', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-08-01 06:14:38', '2020-03-02 04:21:29'),
(23, 'appels_offres', 'appels-offres', 'Appel d\'offre', 'Appels Offres', 'voyager-bell', 'App\\AppelsOffre', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-08-01 07:33:11', '2020-06-11 15:37:30'),
(29, 'associations_scientifique', 'associations-scientifique', 'Association scientifique', 'Associations Scientifiques', NULL, 'App\\AssociationsScientifique', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-02 05:06:10', '2019-08-02 05:06:10'),
(31, 'concours_prix', 'concours-prix', 'Concours Prix', 'Concours Prixes', NULL, 'App\\ConcoursPrix', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-02 05:13:31', '2019-08-02 05:13:31'),
(32, 'concours_prixs', 'concours-prixs', 'Concours Prix', 'Concours Prixes', NULL, 'App\\ConcoursPrix', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-02 05:13:59', '2019-08-02 05:13:59'),
(36, 'articles', 'articles', 'Page', 'Pages', 'voyager-documentation', 'App\\Article', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-02 06:45:24', '2020-06-17 08:51:29'),
(41, 'galleries', 'galleries', 'Gallery', 'Galleries', 'voyager-photos', 'App\\Gallery', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-08-02 07:26:48', '2020-07-22 08:05:19'),
(44, 'raccourci_rapides', 'raccourci-rapides', 'Raccourci Rapide', 'Raccourcis Rapides', 'voyager-tag', 'App\\RaccourciRapide', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 03:48:42', '2020-07-01 09:54:05'),
(50, 'liens', 'liens', 'Lien utile', 'Liens utiles', 'voyager-paperclip', 'App\\Lien', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 04:59:30', '2020-03-19 03:35:51'),
(54, 'sliders', 'sliders', 'Slider', 'Sliders', 'voyager-credit-cards', 'App\\Slider', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":\"created_at\",\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2019-08-08 08:13:52', '2020-03-02 03:34:50'),
(60, 'statistiques', 'statistiques', 'Statistique', 'Statistiques', 'voyager-pie-graph', 'App\\Statistique', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-26 06:27:14', '2020-03-19 03:40:22'),
(65, 'sites_utiles', 'sites-utiles', 'Site Utile', 'Sites Utiles', 'voyager-world', 'App\\SitesUtile', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-01-11 07:12:02', '2020-03-19 03:40:10'),
(71, 'demandeacces', 'demandeacces', 'Demande d’accès', 'Demande d’accès', NULL, 'App\\Demandeacce', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-02-28 04:51:52', '2020-02-28 04:51:52'),
(72, 'messages_prive', 'messages-prive', 'Messages Prive', 'Messages Prives', NULL, 'App\\MessagesPrive', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-02-28 04:52:14', '2020-02-28 04:52:14'),
(73, 'reclamation', 'reclamation', 'Reclamation', 'Reclamations', NULL, 'App\\Reclamation', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-02-28 04:52:34', '2020-02-28 04:52:34'),
(75, 'reponse_messages_prive', 'reponse-messages-prive', 'Reponse Messages Prive', 'Reponse Messages Prives', NULL, 'App\\ReponseMessagesPrive', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-02-28 04:52:58', '2020-02-28 04:52:58'),
(76, 'reponse_reclamation', 'reponse-reclamation', 'Reponse Reclamation', 'Reponse Reclamations', NULL, 'App\\ReponseReclamation', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-02-28 04:53:09', '2020-02-28 04:53:09'),
(77, 'citoyen', 'citoyen', 'Citoyen', 'Citoyens', NULL, 'App\\Citoyen', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-02-28 05:32:22', '2020-02-28 05:32:22'),
(78, 'citoyens', 'citoyens', 'Citoyen', 'Citoyens', NULL, 'App\\Citoyen', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-28 05:45:24', '2020-06-22 13:17:21'),
(79, 'demande_acces', 'demande-acces', 'Demande Acce', 'Demande Acces', NULL, 'App\\DemandeAcce', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-28 05:49:33', '2020-03-30 04:22:27'),
(82, 'reclamations', 'reclamations', 'Reclamation', 'Reclamations', NULL, 'App\\Reclamation', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-28 06:06:41', '2020-06-22 15:10:32'),
(90, 'messages_privates', 'messages-privates', 'Messages Private', 'Messages Privates', NULL, 'App\\MessagesPrivate', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-28 06:39:07', '2020-06-22 15:24:58'),
(98, 'pub_recherches', 'pub-recherches', 'Publication & Recherche', 'Publications & Recherches', NULL, 'App\\PubRecherch', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-18 06:09:52', '2020-06-30 10:10:27'),
(99, 'demande_docs', 'demande-docs', 'Demande Doc', 'Demande Docs', NULL, 'App\\DemandeDoc', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-08 07:13:20', '2020-06-22 15:30:09'),
(100, 'type_docs', 'type-docs', 'Type Doc', 'Type Docs', NULL, 'App\\TypeDoc', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-09 08:15:28', '2020-04-09 08:19:13'),
(104, 'accueil_composants', 'accueil-composants', 'Composition de la page d\'accueil', 'Composition de la page d\'accueil', NULL, 'App\\AccueilComposant', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-05-11 08:58:37', '2020-05-15 11:59:06'),
(108, 'denonciations', 'denonciations', 'Denonciation', 'Denonciations', NULL, 'App\\Denonciation', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-24 10:15:57', '2020-06-30 13:15:11'),
(109, 'abonnes', 'abonnes', 'Abonné', 'Abonnés', NULL, 'App\\Abonne', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-06 10:10:31', '2020-07-06 10:14:48'),
(110, 'messagenewsletters', 'messagenewsletters', 'Newsletter', 'NewsLetters', NULL, 'App\\Messagenewsletter', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-09 08:07:15', '2020-07-09 08:58:51'),
(111, 'annuaire_etablissements', 'annuaire-etablissements', 'Annuaire Etablissement', 'Annuaire Etablissements', NULL, 'App\\AnnuaireEtablissement', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-08-04 09:20:37', '2020-08-04 09:20:37'),
(112, 'cooperations', 'cooperations', 'Cooperation', 'Cooperations', NULL, 'App\\Cooperation', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-08-04 09:20:53', '2020-08-04 09:20:53'),
(116, 'budget_partcipatifs', 'budget-partcipatifs', 'Budget Partcipatif', 'Budget Partcipatifs', NULL, 'App\\BudgetPartcipatif', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-04 10:50:47', '2020-08-05 08:18:09'),
(117, 'conseil_municipales', 'conseil-municipales', 'Conseil Municipale', 'Conseil Municipales', NULL, 'App\\ConseilMunicipale', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-04 10:53:47', '2020-08-11 12:08:24'),
(118, 'finances', 'finances', 'Finance', 'Finances', NULL, 'App\\Finance', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-04 10:54:10', '2020-08-05 08:20:54'),
(119, 'projets_realisations', 'projets-realisations', 'Projets Realisation', 'Projets Realisations', NULL, 'App\\ProjetsRealisation', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-04 10:54:32', '2020-08-05 08:49:57'),
(125, 'articles_travaux_associations', 'articles-travaux-associations', 'Articles Travaux Association', 'Articles Travaux Associations', NULL, 'App\\ArticlesTravauxAssociation', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-05 08:08:20', '2020-08-05 09:17:58'),
(126, 'protection_socio_enviros', 'protection-socio-enviros', 'Protection Socio Enviro', 'Protection Socio Enviros', NULL, 'App\\ProtectionSocioEnviro', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-05 08:53:18', '2020-08-05 09:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `demande_acces`
--

CREATE TABLE `demande_acces` (
  `id` int(10) UNSIGNED NOT NULL,
  `codeDemande` varchar(255) NOT NULL,
  `IdDemandeur` int(11) NOT NULL,
  `Info` text NOT NULL,
  `ServiceConcerne` varchar(255) NOT NULL,
  `ReferenceDocs` varchar(255) DEFAULT NULL,
  `Remarques` text DEFAULT NULL,
  `FormeAcce` varchar(255) DEFAULT NULL,
  `DateDemande` datetime DEFAULT NULL,
  `EtatDemande` int(11) DEFAULT NULL,
  `PiecesJointes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `creerPar` varchar(255) DEFAULT NULL,
  `modifierPar` varchar(255) DEFAULT NULL,
  `NomDocumentDemande` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `demande_docs`
--

CREATE TABLE `demande_docs` (
  `id` int(10) UNSIGNED NOT NULL,
  `citoyen_id` int(11) DEFAULT NULL,
  `date_demande` datetime DEFAULT NULL,
  `etat` tinyint(4) DEFAULT NULL,
  `raison_refus` varchar(255) DEFAULT NULL,
  `langue` varchar(255) DEFAULT NULL,
  `traiter_par` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_docs_id` int(11) DEFAULT NULL,
  `type_envoi` tinyint(4) DEFAULT NULL,
  `libelle_type_doc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `denonciations`
--

CREATE TABLE `denonciations` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_personne` int(11) DEFAULT NULL,
  `raison_sociale` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `identifie` tinyint(4) DEFAULT NULL,
  `structure_signale` varchar(255) DEFAULT NULL,
  `secteur` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `PiecesJointes` text DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prenom` varchar(255) DEFAULT NULL,
  `CIN` varchar(255) DEFAULT NULL,
  `TrancheAge` varchar(109) DEFAULT NULL,
  `Sexe` tinyint(4) DEFAULT NULL,
  `Profession` varchar(255) DEFAULT NULL,
  `Gouvernorat` varchar(255) DEFAULT NULL,
  `personne_signale` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `creerPar` varchar(255) DEFAULT NULL,
  `modifierPar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emailnonenvoyes`
--

CREATE TABLE `emailnonenvoyes` (
  `id` int(10) UNSIGNED NOT NULL,
  `TextEmail` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Sujet` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evenements`
--

CREATE TABLE `evenements` (
  `id` int(10) UNSIGNED NOT NULL,
  `titre_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Vignette` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `Alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `lieu_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `titre_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lieu_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lieu_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_ar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_en` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ATTENTE',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `carousel` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `googlemaps_marker` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creerPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifierPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `finances`
--

CREATE TABLE `finances` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Annee` int(11) DEFAULT NULL,
  `titre_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TypeFinance` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FichierFinance` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` longtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `titre_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `description_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_ar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_en` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ATTENTE',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Images` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `videos` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `creerPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifierPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL,
  `youtube` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lienyoutube` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `liens`
--

CREATE TABLE `liens` (
  `id` int(10) UNSIGNED NOT NULL,
  `titre_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lien` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nv_onglet` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `afficher_dans` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  `creerPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifierPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `liens`
--

INSERT INTO `liens` (`id`, `titre_fr`, `titre_ar`, `titre_en`, `lien`, `deleted_at`, `created_at`, `updated_at`, `nv_onglet`, `afficher_dans`, `ordre`, `creerPar`, `modifierPar`, `approuverPar`, `approuverLe`, `depublierLe`, `status`) VALUES
(7, 'contact@commune-benimtir.tn', 'contact@commune-benimtir.tn', 'contact@commune-benimtir.tn', '#', NULL, '2020-01-12 06:52:22', '2022-07-28 10:19:32', '_self', 'top_header', 2, '1', '1', NULL, NULL, NULL, 'PUBLISHED'),
(13, 'Contact', 'للإتصال بنا', 'Contact', 'contact', NULL, '2020-01-14 05:12:04', '2020-08-07 12:32:23', '_blank', 'top_header', 8, '1', '1', NULL, NULL, NULL, 'PUBLISHED'),
(16, 'Agence Nationale pour l\'Emploi et le Travail', 'الوكالة الوطنية للتشغيل و العمل المستقل', NULL, 'http://www.emploi.nat.tn/fo/Fr/global.php', NULL, '2020-05-26 17:36:00', '2020-08-07 12:34:37', '_blank', 'footer', NULL, '1', '1', NULL, NULL, NULL, 'PUBLISHED'),
(17, 'Portail open Data', 'موقع البيانات المفتوحة', 'National Services and Residences Company', 'http://www.data.gov.tn/fr/', NULL, '2020-05-26 17:36:23', '2020-08-07 12:34:04', '_blank', 'footer', NULL, '1', '1', NULL, NULL, NULL, 'PUBLISHED'),
(18, 'Imprimerie officielle de la République', 'المطبعة الرسمية للجمهورية التونسية', 'The Higher Institute of Islamic Civilization', 'http://www.iort.gov.tn/', NULL, '2020-06-17 15:07:37', '2020-08-07 12:33:33', '_self', 'footer', NULL, '1', '1', NULL, NULL, NULL, 'PUBLISHED'),
(19, 'Portail du gouvernement Tunisien', 'بوابة الحكومة التونسية', NULL, 'http://www.tunisie.gov.tn/index.php?lang=french', NULL, '2020-08-07 12:38:05', '2020-08-07 12:38:05', '_self', 'footer', NULL, '1', NULL, NULL, NULL, NULL, 'PUBLISHED'),
(20, 'Ministère de l\'Intérieur Tunisien', 'وزارة الداخلية', NULL, 'http://www.interieur.gov.tn/', NULL, '2020-08-07 12:39:22', '2020-08-07 12:39:22', '_self', 'footer', NULL, '1', NULL, NULL, NULL, NULL, 'PUBLISHED'),
(21, 'Galerie', 'ألبوم الصور', NULL, '/galleries', NULL, '2020-08-12 08:43:37', '2020-08-12 12:08:12', '_self', 'top_header', 3, '1', '1', NULL, NULL, NULL, 'PUBLISHED'),
(22, 'Appels d\'offre', 'طلبات العروض', NULL, '/appelsOffres', NULL, '2020-08-12 12:29:25', '2020-08-12 12:30:22', '_self', 'top_header', 4, '1', '1', NULL, NULL, NULL, 'PUBLISHED');

-- --------------------------------------------------------

--
-- Structure de la table `listes_contacts`
--

CREATE TABLE `listes_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `Nom_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nom_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nom_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `poste` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `list_articles`
--

CREATE TABLE `list_articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `id_article_fils` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-07-23 04:29:14', '2019-07-23 04:29:14'),
(7, 'side', '2020-06-01 14:27:30', '2020-06-01 14:27:30'),
(8, 'menu', '2020-06-12 10:11:54', '2020-06-12 10:11:54');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `page` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `side_bar` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'off',
  `item_sidebar` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'off',
  `mega_menu` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'off',
  `title_en` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_ar` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`, `page`, `side_bar`, `item_sidebar`, `mega_menu`, `title_en`, `title_ar`) VALUES
(1, 1, 'Tableau de bord', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2019-07-23 04:29:14', '2019-11-21 06:07:02', 'voyager.dashboard', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', '#000000', NULL, 4, '2019-07-23 04:29:14', '2019-12-07 04:59:03', 'voyager.media.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 'Utilisateurs', '', '_self', 'voyager-person', '#000000', NULL, 3, '2019-07-23 04:29:14', '2019-10-16 06:16:17', 'voyager.users.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-07-23 04:29:14', '2019-07-23 04:29:14', 'voyager.roles.index', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, 'Outils', '#', '_self', 'voyager-tools', '#000000', NULL, 12, '2019-07-23 04:29:15', '2020-08-05 09:01:50', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, 'Constructeur de menu', '', '_self', 'voyager-list', '#000000', 5, 1, '2019-07-23 04:29:15', '2019-10-16 06:19:36', 'voyager.menus.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-07-23 04:29:15', '2020-04-09 08:17:25', 'voyager.database.index', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-07-23 04:29:15', '2020-04-09 08:17:25', 'voyager.compass.index', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-07-23 04:29:15', '2020-04-09 08:17:25', 'voyager.bread.index', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 1, 'Paramètres', '', '_self', 'voyager-settings', '#000000', NULL, 13, '2019-07-23 04:29:15', '2020-08-05 09:01:50', 'voyager.settings.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-07-23 04:29:46', '2020-04-09 08:17:26', 'voyager.hooks', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 1, 'Actualités', '', '_self', 'voyager-news', '#000000', 61, 2, '2019-07-24 06:15:53', '2020-08-05 09:01:39', 'voyager.actualites.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 1, 'Contacts', '', '_self', 'voyager-telephone', '#000000', 61, 8, '2019-08-01 04:26:33', '2020-08-05 09:01:40', 'voyager.contacts.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 1, 'Événements', '', '_self', 'voyager-calendar', '#000000', 61, 3, '2019-08-01 05:04:07', '2020-08-05 09:01:39', 'voyager.evenements.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(31, 1, 'Appels Offres', '', '_self', 'voyager-bell', '#000000', 61, 4, '2019-08-01 07:33:11', '2020-08-05 09:01:39', 'voyager.appels-offres.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(43, 1, 'Pages', '', '_self', 'voyager-documentation', '#000000', 61, 1, '2019-08-02 06:45:24', '2019-10-16 06:17:12', 'voyager.articles.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(47, 1, 'Galleries', '', '_self', 'voyager-photos', '#000000', 61, 6, '2019-08-02 07:26:49', '2020-08-05 09:01:39', 'voyager.galleries.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(49, 1, 'Modules', '#', '_self', 'voyager-documentation', '#000000', NULL, 7, '2019-08-03 04:57:06', '2020-08-04 11:12:52', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(51, 1, 'Raccourcis Rapides', '', '_self', 'voyager-tag', '#000000', 49, 2, '2019-08-05 03:48:42', '2020-03-02 03:29:40', 'voyager.raccourci-rapides.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(58, 1, 'Liens utiles', '', '_self', 'voyager-paperclip', '#000000', 49, 3, '2019-08-05 04:59:30', '2020-03-02 03:29:41', 'voyager.liens.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(60, 1, 'Sliders', '', '_self', 'voyager-credit-cards', '#000000', 49, 1, '2019-08-08 08:13:52', '2020-01-11 06:53:03', 'voyager.sliders.index', 'null', NULL, NULL, NULL, NULL, NULL, NULL),
(61, 1, 'Contenu', '#', '_self', 'voyager-character', '#000000', NULL, 6, '2019-08-14 05:10:56', '2020-08-04 11:12:54', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL),
(62, 8, 'Acceuil', '/', '_self', NULL, '#000000', NULL, 1, '2019-08-15 12:30:59', '2019-11-13 14:36:09', NULL, '', NULL, NULL, NULL, NULL, NULL, 'الإستقبال'),
(76, 1, 'Statistiques', '', '_self', 'voyager-pie-graph', '#000000', 61, 7, '2019-08-26 06:27:14', '2020-08-05 09:01:40', 'voyager.statistiques.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(88, 8, 'La ville', '#', '_self', NULL, '#000000', NULL, 2, '2019-10-18 15:07:12', '2019-11-08 14:40:33', NULL, '', NULL, 'off', 'off', 'off', NULL, 'تقديم المدينة'),
(89, 8, 'Présentation de la ville', '/pages/presentation-de-la-ville', '_self', NULL, '#000000', 88, 1, '2019-10-18 15:07:26', '2020-08-17 09:34:53', NULL, '', NULL, 'off', 'off', 'off', NULL, 'تقديم المدينة'),
(90, 8, 'Lieux touristiques', '/pages/lieux-touristiques', '_self', NULL, '#000000', 88, 5, '2019-11-08 11:09:47', '2020-08-17 09:43:46', NULL, '', 'lieux-touristiques', 'off', 'off', 'off', NULL, 'الأماكن السياحية'),
(91, 8, 'Situation géographique', '/pages/situation-geographique', '_self', NULL, '#000000', 88, 4, '2019-11-08 12:21:50', '2020-08-17 09:43:46', NULL, '', 'situation-geographique', 'off', 'off', 'off', NULL, 'الموقع الجغرافي'),
(92, 8, 'La Mairie', '#', '_self', NULL, '#000000', NULL, 3, '2019-11-08 14:17:52', '2020-08-17 09:43:46', NULL, '', NULL, 'off', 'off', 'off', NULL, 'تقديم البلدية'),
(93, 8, 'Présentation de la mairie', '/pages/presentation-de-la-mairie', '_self', NULL, '#000000', 92, 1, '2019-11-08 14:18:45', '2019-11-12 10:25:25', NULL, '', 'presentation-de-la-mairie', 'off', 'off', 'off', NULL, 'تعريف البلدية'),
(94, 8, 'Services municipaux', '/pages/services-municipaux', '_self', NULL, '#000000', 92, 2, '2019-11-08 14:19:24', '2019-11-12 10:25:43', NULL, '', 'services-municipaux', 'off', 'off', 'off', NULL, 'المصالح البلدية'),
(95, 8, 'Horaires de travail', '/pages/horaire-de-travail', '_self', NULL, '#000000', 92, 3, '2019-11-08 14:23:05', '2019-11-12 10:26:10', NULL, '', 'horaire-de-travail', 'off', 'off', 'off', NULL, 'التوقيت الإداري'),
(96, 8, 'Prestations', '#', '_self', NULL, '#000000', NULL, 4, '2019-11-08 14:45:25', '2020-08-17 09:43:46', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الخدمات'),
(97, 8, 'Etat Civil﻿', '#', '_self', NULL, '#000000', 96, 1, '2019-11-08 14:47:16', '2019-11-12 10:42:27', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الحالة المدنية'),
(98, 8, 'Légalisation de signature﻿', '/pages/legalisation-de-signature', '_self', NULL, '#000000', 97, 1, '2019-11-08 14:47:33', '2019-11-12 10:27:09', NULL, '', 'legalisation-de-signature', 'off', 'off', 'off', NULL, 'التعريف بالإمضاء'),
(99, 8, 'Certification des copies﻿', '/pages/certification-des-copies', '_self', NULL, '#000000', 97, 2, '2019-11-08 14:47:44', '2019-11-12 10:27:30', NULL, '', 'certification-des-copies', 'off', 'off', 'off', NULL, 'النسخ طبق الأصل'),
(100, 8, 'Naissance﻿', '/pages/le-mariage', '_self', NULL, '#000000', 97, 3, '2019-11-08 14:48:03', '2019-11-12 10:27:55', NULL, '', 'le-mariage', 'off', 'off', 'off', NULL, 'الولادات'),
(101, 8, 'Le décès', '/pages/le-deces', '_self', NULL, '#000000', 97, 4, '2019-11-08 14:48:18', '2020-08-12 12:04:38', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الوفيات'),
(102, 8, 'Le mariage﻿', '/pages/le-mariage', '_self', NULL, '#000000', 97, 5, '2019-11-08 14:48:29', '2019-11-12 10:28:49', NULL, '', 'le-mariage', 'off', 'off', 'off', NULL, 'الزواج'),
(103, 8, 'Les extraits d\'état civil﻿', '/pages/les-extraits-d-etat-civil', '_self', NULL, '#000000', 97, 6, '2019-11-08 14:48:40', '2020-08-17 09:43:44', NULL, '', 'les-extraits-d-etat-civil', 'off', 'off', 'off', NULL, 'رسم الحالة المدنية'),
(104, 8, 'Réctification des actes d’état civil﻿', '/pages/rectification-des-actes-d-etat-civil', '_self', NULL, '#000000', 97, 7, '2019-11-08 14:48:51', '2020-08-17 09:43:44', NULL, '', 'rectification-des-actes-d-etat-civil', 'off', 'off', 'off', NULL, 'التنصيص على رسم من الحالة المدنية'),
(105, 8, 'Le livret de famille﻿', '/pages/les-extraits-d-etat-civil', '_self', NULL, '#000000', 97, 8, '2019-11-08 14:49:01', '2020-08-17 09:43:44', NULL, '', 'les-extraits-d-etat-civil', 'off', 'off', 'off', NULL, 'السجل العائلي'),
(106, 8, 'Autorisations﻿', '#', '_self', NULL, '#000000', 96, 2, '2019-11-08 14:50:41', '2019-11-12 10:43:21', NULL, '', NULL, 'off', 'off', 'off', NULL, 'التراخيص'),
(107, 8, 'Autorisation de raccordement aux STEG,SONEDE', '/pages/autorisation-de-raccordement-aux-reseaux-publics-sonede-steg', '_self', NULL, '#000000', 106, 1, '2019-11-08 14:51:00', '2019-11-12 10:34:42', NULL, '', 'autorisation-de-raccordement-aux-reseaux-publics-sonede-steg', 'off', 'off', 'off', NULL, 'الربط بشبكة الكرهباء و الماء'),
(108, 8, 'Autorisation de raccordement ONAS', '/pages/autorisation-de-raccordement-aux-reseaux-publics-onas', '_self', NULL, '#000000', 106, 2, '2019-11-08 14:51:51', '2019-11-12 10:35:05', NULL, '', 'autorisation-de-raccordement-aux-reseaux-publics-onas', 'off', 'off', 'off', NULL, 'الربط بشبكة التطهير'),
(109, 8, 'Autorisations D\'occupation﻿', '/pages/autorisations-d-occupation', '_self', NULL, '#000000', 106, 3, '2019-11-08 14:52:02', '2019-11-12 10:35:55', NULL, '', 'autorisations-d-occupation', 'off', 'off', 'off', NULL, 'رخصة إشغال'),
(110, 8, 'Autorisations Économiques﻿', '/pages/autorisations-economiques', '_self', NULL, '#000000', 106, 4, '2019-11-08 14:52:14', '2020-08-12 12:18:13', NULL, '', 'autorisations-economiques', 'off', 'off', 'off', NULL, 'التراخيص الإقتصادية'),
(111, 8, 'Permis d\'urbanisme﻿', '#', '_self', NULL, '#000000', 96, 3, '2019-11-08 14:52:52', '2020-08-17 09:43:42', NULL, '', NULL, 'off', 'off', 'off', NULL, 'رخص البناء'),
(112, 8, 'Dossier de Permis de bâtir﻿', '/pages/permission-d-inhumation', '_self', NULL, '#000000', 111, 1, '2019-11-08 14:53:03', '2019-11-25 13:34:35', NULL, '', 'permission-d-inhumation', 'off', 'off', 'off', NULL, 'ملف رخصة البناء'),
(113, 8, 'Les commissions des permis de bâtir', '/pages/les-commissions-des-permis-de-batir', '_self', NULL, '#000000', 111, 2, '2019-11-08 14:53:14', '2019-11-12 10:41:34', NULL, '', 'les-commissions-des-permis-de-batir', 'off', 'off', 'off', NULL, 'جلسات رخص البناء'),
(114, 8, 'Fiscalité Locale﻿', '/pages/fiscalite-locale', '_self', NULL, '#000000', 96, 4, '2019-11-08 14:53:27', '2020-08-17 09:43:42', NULL, '', 'fiscalite-locale', 'off', 'off', 'off', NULL, 'الجباية المحلية'),
(115, 8, 'Gouvernance et transparence﻿', '#', '_self', NULL, '#000000', NULL, 5, '2019-11-08 14:59:50', '2020-08-17 09:43:47', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الحوكمة و الشفافية'),
(116, 8, 'Le conseil municipal﻿', '/conseil-municipal', '_self', NULL, '#000000', 115, 1, '2019-11-08 15:00:22', '2019-11-12 10:59:14', NULL, '', NULL, 'off', 'off', 'off', NULL, 'المجلس البلدي'),
(117, 8, 'Réunions ordinaires﻿', '/conseil-municipal/ORDINAIRE', '_self', NULL, '#000000', 116, 1, '2019-11-08 15:01:07', '2019-11-12 11:16:38', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الجلسات العادية'),
(118, 8, 'Réunions préparatoires﻿', '/conseil-municipal/PREP', '_self', NULL, '#000000', 116, 2, '2019-11-08 15:01:28', '2019-11-12 11:14:44', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الجلسات التمهيدية'),
(119, 8, 'Réunions extraordinaires﻿', '/conseil-municipal/EXTRA', '_self', NULL, '#000000', 116, 3, '2019-11-08 15:01:55', '2019-11-12 11:15:42', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الجلسات الإستثنائية'),
(120, 8, 'Finance﻿', '/finance', '_self', NULL, '#000000', 115, 2, '2019-11-08 15:02:47', '2020-08-17 09:43:39', NULL, '', NULL, 'off', 'off', 'off', NULL, 'المالية'),
(121, 8, 'Budgets', '/finance/BUDGET', '_self', NULL, '#000000', 120, 1, '2019-11-08 15:03:04', '2019-11-12 12:40:45', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الميزانية'),
(122, 8, 'Comptes financiers﻿', '/finance/COMPTEFINANCIER', '_self', NULL, '#000000', 120, 2, '2019-11-08 15:03:24', '2020-08-12 12:18:07', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الحسابات المالية'),
(123, 8, 'Les dettes﻿', '/finance/DETTES', '_self', NULL, '#000000', 120, 3, '2019-11-08 15:03:41', '2020-08-12 12:18:07', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الديون'),
(124, 8, 'Le recouvrement﻿', '/finance/RECOUVREMENT', '_self', NULL, '#000000', 120, 4, '2019-11-08 15:07:12', '2020-08-12 12:18:07', NULL, '', NULL, 'off', 'off', 'off', NULL, 'التغطية'),
(125, 8, 'Les résultats de performance﻿', '/finance/RESULTATPERFO', '_self', NULL, '#000000', 120, 5, '2019-11-08 15:07:35', '2020-08-12 12:18:07', NULL, '', NULL, 'off', 'off', 'off', NULL, 'تقييم الأداء البلدي'),
(126, 8, 'Plan d\'appels d\'offres﻿', '/finance/PLANAPPELOFFRES', '_self', NULL, '#000000', 120, 6, '2019-11-08 15:07:57', '2020-08-12 12:18:08', NULL, '', NULL, 'off', 'off', 'off', NULL, 'جدول قيادة الصفقات'),
(127, 8, 'Projets et réalisations﻿', '/projets-realisations/', '_self', NULL, '#000000', 115, 3, '2019-11-08 15:24:15', '2020-08-17 09:43:39', NULL, '', NULL, 'off', 'off', 'off', NULL, 'المشاريع و الإنجازات'),
(128, 8, 'Projets dans le PIC﻿', '/projets-realisations/PROJETDANSPIC', '_self', NULL, '#000000', 127, 1, '2019-11-08 15:24:46', '2019-11-08 15:26:23', NULL, '', NULL, 'off', 'off', 'off', NULL, 'مشاريع داخل مخطط الإستثمار'),
(129, 8, 'Projets hors le PIC﻿', '/projets-realisations/PROJETHORSPIC', '_self', NULL, '#000000', 127, 2, '2019-11-08 15:25:19', '2020-08-17 09:43:35', NULL, '', NULL, 'off', 'off', 'off', NULL, 'مشاريع خارج مخطط الإستثمار'),
(130, 8, 'Plan d’investissement annuel﻿', '/projets-realisations/PLANINVESTISSEMENT', '_self', NULL, '#000000', 127, 3, '2019-11-08 15:25:41', '2020-08-17 09:43:35', NULL, '', NULL, 'off', 'off', 'off', NULL, 'مخطط الإستثمار السنوي'),
(131, 8, 'Evaluations des réalisations des projets﻿', '/projets-realisations/EVALUATIONREALISATION', '_self', NULL, '#000000', 127, 4, '2019-11-08 15:26:10', '2020-08-17 09:43:35', NULL, '', NULL, 'off', 'off', 'off', NULL, 'تقييم تقدم المشاريع'),
(132, 8, 'Budget participatif﻿', '/budget-participatif/', '_self', NULL, '#000000', 115, 4, '2019-11-08 15:26:59', '2020-08-17 09:43:40', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الميزانية التشاركية'),
(133, 8, 'Accès aux informations﻿', '/page/acces-aux-documents-administratifs', '_self', NULL, '#000000', 115, 6, '2019-11-08 15:27:32', '2020-08-17 09:43:40', NULL, '', 'acces-aux-documents-administratifs', 'off', 'off', 'off', NULL, 'النفاذ للمعلومة'),
(134, 8, 'Contact', '/contact', '_self', NULL, '#000000', NULL, 6, '2019-11-08 15:29:43', '2020-08-17 09:43:47', NULL, '', NULL, 'off', 'off', 'off', NULL, 'للإتصال'),
(135, 8, 'Diagnostic technique et financier﻿', '/budget-participatif/DIAGNOSTIQUE_TECH_FINANCIER', '_self', NULL, '#000000', 132, 1, '2019-11-08 15:31:12', '2019-11-12 13:33:47', NULL, '', 'delimitation-de-la-mort', 'off', 'off', 'off', NULL, 'التقييم الفني و المالي'),
(136, 8, 'Élaboration du programme participatif﻿', '/budget-participatif/ELABORATION_PROGRAMME', '_self', NULL, '#000000', 132, 2, '2019-11-08 15:31:45', '2019-11-12 13:34:37', NULL, '', NULL, 'off', 'off', 'off', NULL, 'إعداد برنامج الإستثمار التشاركي'),
(137, 8, 'Budget participatif﻿', '/budget-participatif/BUDGET_PARTICIPATIF', '_self', NULL, '#000000', 132, 3, '2019-11-08 15:32:22', '2019-11-12 10:59:37', NULL, '', NULL, 'off', 'off', 'off', NULL, 'المزانية التشاركية'),
(138, 8, 'Commissions participatifs par arrondissement﻿', '/budget-participatif/COMMISSION_PAR_ARRONDISSEMENT', '_self', NULL, '#000000', 132, 4, '2019-11-08 15:33:01', '2019-11-08 15:35:24', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الجلسات التشاركية بالمناطق'),
(139, 8, 'Commissions participatifs﻿', '/budget-participatif/COMMISIONS_PARTICIPATIFS', '_self', NULL, '#000000', 132, 5, '2019-11-08 15:33:35', '2019-11-12 10:59:37', NULL, '', NULL, 'off', 'off', 'off', NULL, 'الجلسات التشاركية'),
(140, 8, 'Protection socio-environnemental﻿', '/pages/protection-socio-environnemental', '_self', NULL, '#000000', 115, 5, '2019-11-08 15:34:21', '2020-08-17 09:43:40', NULL, '', 'protection-socio-environnemental', 'off', 'off', 'off', NULL, 'حماية البيئة و المحيط'),
(160, 1, 'Sites Utiles', '', '_self', 'voyager-world', '#000000', 49, 4, '2020-01-11 07:12:03', '2020-05-13 10:11:19', 'voyager.sites-utiles.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(176, 1, 'Citoyens', '', '_self', NULL, NULL, 175, 1, '2020-02-28 05:45:25', '2020-03-02 03:29:48', 'voyager.citoyens.index', NULL, NULL, 'off', 'off', 'off', NULL, NULL),
(177, 1, 'Demande d\'accès', '', '_self', NULL, '#000000', 175, 4, '2020-02-28 05:49:33', '2020-08-05 09:01:46', 'voyager.demande-acces.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(179, 1, 'Réclamations', '', '_self', NULL, '#000000', 175, 2, '2020-02-28 06:06:41', '2020-08-05 09:01:29', 'voyager.reclamations.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(181, 1, 'Messages Privés', '', '_self', NULL, '#000000', 175, 3, '2020-02-28 06:39:08', '2020-08-05 09:01:46', 'voyager.messages-privates.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(186, 1, 'Demande Documents', '', '_self', 'voyager-receipt', '#000000', 175, 5, '2020-04-08 07:13:21', '2020-08-05 09:01:46', 'voyager.demande-docs.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(187, 1, 'Type Docs', '', '_self', NULL, NULL, 175, 6, '2020-04-09 08:15:29', '2020-08-05 09:01:47', 'voyager.type-docs.index', NULL, NULL, 'off', 'off', 'off', NULL, NULL),
(194, 7, 'Recherche en Tunisie', '', '_self', NULL, '#000000', NULL, 1, '2020-06-01 14:27:57', '2020-06-01 14:28:09', NULL, '', NULL, 'off', 'off', 'off', NULL, 'المدينة بالأرقام'),
(196, 7, 'dddd', '', '_self', NULL, '#000000', 194, 1, '2020-06-01 14:28:25', '2020-06-01 14:45:04', NULL, '', NULL, 'off', 'off', 'off', NULL, 'ddddd'),
(197, 7, '<xcwxc', '', '_self', NULL, '#000000', NULL, 15, '2020-06-01 14:45:35', '2020-06-01 14:45:35', NULL, '', NULL, 'off', 'off', 'off', NULL, 'تاريخ المدينة'),
(257, 1, 'Abonnés', '', '_self', 'voyager-people', '#000000', 258, 1, '2020-07-06 10:10:32', '2020-07-06 10:37:15', 'voyager.abonnes.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(258, 1, 'NewsLetter', '#', '_self', 'voyager-mail', '#000000', NULL, 8, '2020-07-06 10:34:20', '2020-08-05 09:01:49', NULL, '', NULL, 'off', 'off', 'off', NULL, NULL),
(260, 1, 'Rédiger un message', '', '_self', 'voyager-file-text', '#000000', 258, 2, '2020-07-09 08:07:16', '2020-08-04 11:11:53', 'voyager.messagenewsletters.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(263, 1, 'Budget Partcipatifs', '', '_self', 'voyager-pie-chart', '#000000', 269, 1, '2020-08-04 10:50:48', '2020-08-04 11:42:28', 'voyager.budget-partcipatifs.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(264, 1, 'Conseil Municipales', '', '_self', 'voyager-news', '#000000', 269, 2, '2020-08-04 10:53:47', '2020-08-04 11:25:14', 'voyager.conseil-municipales.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(265, 1, 'Finances', '', '_self', 'voyager-dollar', '#000000', 269, 3, '2020-08-04 10:54:10', '2020-08-04 11:24:53', 'voyager.finances.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(266, 1, 'Projets Realisations', '', '_self', 'voyager-hammer', '#000000', 269, 4, '2020-08-04 10:54:32', '2020-08-04 11:27:22', 'voyager.projets-realisations.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(269, 1, 'Commune', '#', '_self', 'voyager-company', '#000000', NULL, 5, '2020-08-04 11:11:44', '2020-08-04 11:19:37', NULL, '', NULL, 'off', 'off', 'off', NULL, NULL),
(270, 1, 'Travaux Associations', '', '_self', 'voyager-paw', '#000000', 269, 5, '2020-08-05 08:08:20', '2020-08-05 09:02:22', 'voyager.articles-travaux-associations.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(271, 1, 'Protection Socio Enviros', '', '_self', 'voyager-trees', '#000000', 269, 6, '2020-08-05 08:53:19', '2020-08-05 09:03:06', 'voyager.protection-socio-enviros.index', 'null', NULL, 'off', 'off', 'off', NULL, NULL),
(272, 8, 'La ville en chiffres', '/pages/la-ville-en-chiffres', '_self', NULL, '#000000', 88, 3, '2020-08-12 12:17:28', '2020-08-17 09:43:46', NULL, '', NULL, 'off', 'off', 'off', NULL, 'المدينة بالأرقام'),
(273, 8, 'Historique de la ville', '/pages/historique-de-la-ville', '_self', NULL, '#000000', 88, 2, '2020-08-17 09:43:19', '2020-08-17 09:44:56', NULL, '', 'historique-de-la-ville', 'off', 'off', 'off', NULL, 'تاريخ المدينة');

-- --------------------------------------------------------

--
-- Structure de la table `messagenewsletters`
--

CREATE TABLE `messagenewsletters` (
  `id` int(10) UNSIGNED NOT NULL,
  `TextMessage` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Sujet` varchar(255) DEFAULT NULL,
  `creerPar` varchar(255) DEFAULT NULL,
  `modifierPar` varchar(255) DEFAULT NULL,
  `approuverPar` varchar(255) DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `messages_privates`
--

CREATE TABLE `messages_privates` (
  `id` int(10) UNSIGNED NOT NULL,
  `Textmessage` text DEFAULT NULL,
  `DateEnvoie` datetime DEFAULT NULL,
  `Sujet` varchar(255) DEFAULT NULL,
  `Expediteur` varchar(255) DEFAULT NULL,
  `Lu` bit(1) DEFAULT NULL,
  `PiecesJointes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `creerPar` varchar(255) DEFAULT NULL,
  `modifierPar` varchar(255) DEFAULT NULL,
  `id_citoyen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2016_01_01_000000_create_pages_table', 2),
(24, '2016_01_01_000000_create_posts_table', 2),
(25, '2016_02_15_204651_create_categories_table', 2),
(26, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-07-23 04:29:16', '2019-07-23 04:29:16'),
(2, 'browse_bread', NULL, '2019-07-23 04:29:16', '2019-07-23 04:29:16'),
(3, 'browse_database', NULL, '2019-07-23 04:29:16', '2019-07-23 04:29:16'),
(4, 'browse_media', NULL, '2019-07-23 04:29:16', '2019-07-23 04:29:16'),
(5, 'browse_compass', NULL, '2019-07-23 04:29:16', '2019-07-23 04:29:16'),
(6, 'browse_menus', 'menus', '2019-07-23 04:29:16', '2019-07-23 04:29:16'),
(7, 'read_menus', 'menus', '2019-07-23 04:29:16', '2019-07-23 04:29:16'),
(8, 'edit_menus', 'menus', '2019-07-23 04:29:16', '2019-07-23 04:29:16'),
(9, 'add_menus', 'menus', '2019-07-23 04:29:16', '2019-07-23 04:29:16'),
(10, 'delete_menus', 'menus', '2019-07-23 04:29:17', '2019-07-23 04:29:17'),
(11, 'browse_roles', 'roles', '2019-07-23 04:29:17', '2019-07-23 04:29:17'),
(12, 'read_roles', 'roles', '2019-07-23 04:29:17', '2019-07-23 04:29:17'),
(13, 'edit_roles', 'roles', '2019-07-23 04:29:17', '2019-07-23 04:29:17'),
(14, 'add_roles', 'roles', '2019-07-23 04:29:17', '2019-07-23 04:29:17'),
(15, 'delete_roles', 'roles', '2019-07-23 04:29:17', '2019-07-23 04:29:17'),
(16, 'browse_users', 'users', '2019-07-23 04:29:17', '2019-07-23 04:29:17'),
(17, 'read_users', 'users', '2019-07-23 04:29:18', '2019-07-23 04:29:18'),
(18, 'edit_users', 'users', '2019-07-23 04:29:18', '2019-07-23 04:29:18'),
(19, 'add_users', 'users', '2019-07-23 04:29:18', '2019-07-23 04:29:18'),
(20, 'delete_users', 'users', '2019-07-23 04:29:18', '2019-07-23 04:29:18'),
(21, 'browse_settings', 'settings', '2019-07-23 04:29:18', '2019-07-23 04:29:18'),
(22, 'read_settings', 'settings', '2019-07-23 04:29:18', '2019-07-23 04:29:18'),
(23, 'edit_settings', 'settings', '2019-07-23 04:29:18', '2019-07-23 04:29:18'),
(24, 'add_settings', 'settings', '2019-07-23 04:29:18', '2019-07-23 04:29:18'),
(25, 'delete_settings', 'settings', '2019-07-23 04:29:18', '2019-07-23 04:29:18'),
(31, 'browse_posts', 'posts', '2019-07-23 04:29:39', '2019-07-23 04:29:39'),
(32, 'read_posts', 'posts', '2019-07-23 04:29:39', '2019-07-23 04:29:39'),
(33, 'edit_posts', 'posts', '2019-07-23 04:29:39', '2019-07-23 04:29:39'),
(34, 'add_posts', 'posts', '2019-07-23 04:29:39', '2019-07-23 04:29:39'),
(35, 'delete_posts', 'posts', '2019-07-23 04:29:39', '2019-07-23 04:29:39'),
(41, 'browse_hooks', NULL, '2019-07-23 04:29:46', '2019-07-23 04:29:46'),
(42, 'browse_actualites', 'actualites', '2019-07-24 06:15:52', '2019-07-24 06:15:52'),
(43, 'read_actualites', 'actualites', '2019-07-24 06:15:52', '2019-07-24 06:15:52'),
(44, 'edit_actualites', 'actualites', '2019-07-24 06:15:52', '2019-07-24 06:15:52'),
(45, 'add_actualites', 'actualites', '2019-07-24 06:15:52', '2019-07-24 06:15:52'),
(46, 'delete_actualites', 'actualites', '2019-07-24 06:15:52', '2019-07-24 06:15:52'),
(67, 'browse_contacts', 'contacts', '2019-08-01 04:26:33', '2019-08-01 04:26:33'),
(68, 'read_contacts', 'contacts', '2019-08-01 04:26:33', '2019-08-01 04:26:33'),
(69, 'edit_contacts', 'contacts', '2019-08-01 04:26:33', '2019-08-01 04:26:33'),
(70, 'add_contacts', 'contacts', '2019-08-01 04:26:33', '2019-08-01 04:26:33'),
(71, 'delete_contacts', 'contacts', '2019-08-01 04:26:33', '2019-08-01 04:26:33'),
(72, 'browse_evenements', 'evenements', '2019-08-01 05:04:07', '2019-08-01 05:04:07'),
(73, 'read_evenements', 'evenements', '2019-08-01 05:04:07', '2019-08-01 05:04:07'),
(74, 'edit_evenements', 'evenements', '2019-08-01 05:04:07', '2019-08-01 05:04:07'),
(75, 'add_evenements', 'evenements', '2019-08-01 05:04:07', '2019-08-01 05:04:07'),
(76, 'delete_evenements', 'evenements', '2019-08-01 05:04:07', '2019-08-01 05:04:07'),
(92, 'browse_themes', 'themes', '2019-08-01 06:11:41', '2019-08-01 06:11:41'),
(93, 'read_themes', 'themes', '2019-08-01 06:11:41', '2019-08-01 06:11:41'),
(94, 'edit_themes', 'themes', '2019-08-01 06:11:41', '2019-08-01 06:11:41'),
(95, 'add_themes', 'themes', '2019-08-01 06:11:41', '2019-08-01 06:11:41'),
(96, 'delete_themes', 'themes', '2019-08-01 06:11:41', '2019-08-01 06:11:41'),
(97, 'browse_types', 'types', '2019-08-01 06:14:38', '2019-08-01 06:14:38'),
(98, 'read_types', 'types', '2019-08-01 06:14:38', '2019-08-01 06:14:38'),
(99, 'edit_types', 'types', '2019-08-01 06:14:38', '2019-08-01 06:14:38'),
(100, 'add_types', 'types', '2019-08-01 06:14:38', '2019-08-01 06:14:38'),
(101, 'delete_types', 'types', '2019-08-01 06:14:38', '2019-08-01 06:14:38'),
(112, 'browse_appels_offres', 'appels_offres', '2019-08-01 07:33:11', '2019-08-01 07:33:11'),
(113, 'read_appels_offres', 'appels_offres', '2019-08-01 07:33:11', '2019-08-01 07:33:11'),
(114, 'edit_appels_offres', 'appels_offres', '2019-08-01 07:33:11', '2019-08-01 07:33:11'),
(115, 'add_appels_offres', 'appels_offres', '2019-08-01 07:33:11', '2019-08-01 07:33:11'),
(116, 'delete_appels_offres', 'appels_offres', '2019-08-01 07:33:11', '2019-08-01 07:33:11'),
(172, 'browse_articles', 'articles', '2019-08-02 06:45:24', '2019-08-02 06:45:24'),
(173, 'read_articles', 'articles', '2019-08-02 06:45:24', '2019-08-02 06:45:24'),
(174, 'edit_articles', 'articles', '2019-08-02 06:45:24', '2019-08-02 06:45:24'),
(175, 'add_articles', 'articles', '2019-08-02 06:45:24', '2019-08-02 06:45:24'),
(176, 'delete_articles', 'articles', '2019-08-02 06:45:24', '2019-08-02 06:45:24'),
(192, 'browse_galleries', 'galleries', '2019-08-02 07:26:48', '2019-08-02 07:26:48'),
(193, 'read_galleries', 'galleries', '2019-08-02 07:26:48', '2019-08-02 07:26:48'),
(194, 'edit_galleries', 'galleries', '2019-08-02 07:26:48', '2019-08-02 07:26:48'),
(195, 'add_galleries', 'galleries', '2019-08-02 07:26:48', '2019-08-02 07:26:48'),
(196, 'delete_galleries', 'galleries', '2019-08-02 07:26:48', '2019-08-02 07:26:48'),
(207, 'browse_raccourci_rapides', 'raccourci_rapides', '2019-08-05 03:48:42', '2019-08-05 03:48:42'),
(208, 'read_raccourci_rapides', 'raccourci_rapides', '2019-08-05 03:48:42', '2019-08-05 03:48:42'),
(209, 'edit_raccourci_rapides', 'raccourci_rapides', '2019-08-05 03:48:42', '2019-08-05 03:48:42'),
(210, 'add_raccourci_rapides', 'raccourci_rapides', '2019-08-05 03:48:42', '2019-08-05 03:48:42'),
(211, 'delete_raccourci_rapides', 'raccourci_rapides', '2019-08-05 03:48:42', '2019-08-05 03:48:42'),
(237, 'browse_liens', 'liens', '2019-08-05 04:59:30', '2019-08-05 04:59:30'),
(238, 'read_liens', 'liens', '2019-08-05 04:59:30', '2019-08-05 04:59:30'),
(239, 'edit_liens', 'liens', '2019-08-05 04:59:30', '2019-08-05 04:59:30'),
(240, 'add_liens', 'liens', '2019-08-05 04:59:30', '2019-08-05 04:59:30'),
(241, 'delete_liens', 'liens', '2019-08-05 04:59:30', '2019-08-05 04:59:30'),
(247, 'browse_sliders', 'sliders', '2019-08-08 08:13:52', '2019-08-08 08:13:52'),
(248, 'read_sliders', 'sliders', '2019-08-08 08:13:52', '2019-08-08 08:13:52'),
(249, 'edit_sliders', 'sliders', '2019-08-08 08:13:52', '2019-08-08 08:13:52'),
(250, 'add_sliders', 'sliders', '2019-08-08 08:13:52', '2019-08-08 08:13:52'),
(251, 'delete_sliders', 'sliders', '2019-08-08 08:13:52', '2019-08-08 08:13:52'),
(267, 'browse_statistiques', 'statistiques', '2019-08-26 06:27:14', '2019-08-26 06:27:14'),
(268, 'read_statistiques', 'statistiques', '2019-08-26 06:27:14', '2019-08-26 06:27:14'),
(269, 'edit_statistiques', 'statistiques', '2019-08-26 06:27:14', '2019-08-26 06:27:14'),
(270, 'add_statistiques', 'statistiques', '2019-08-26 06:27:14', '2019-08-26 06:27:14'),
(271, 'delete_statistiques', 'statistiques', '2019-08-26 06:27:14', '2019-08-26 06:27:14'),
(292, 'browse_sites_utiles', 'sites_utiles', '2020-01-11 07:12:02', '2020-01-11 07:12:02'),
(293, 'read_sites_utiles', 'sites_utiles', '2020-01-11 07:12:03', '2020-01-11 07:12:03'),
(294, 'edit_sites_utiles', 'sites_utiles', '2020-01-11 07:12:03', '2020-01-11 07:12:03'),
(295, 'add_sites_utiles', 'sites_utiles', '2020-01-11 07:12:03', '2020-01-11 07:12:03'),
(296, 'delete_sites_utiles', 'sites_utiles', '2020-01-11 07:12:03', '2020-01-11 07:12:03'),
(319, 'publish_actualites', 'actualites', '2020-02-10 06:14:52', '2020-02-10 06:14:56'),
(321, 'publish_appels_offres', 'appels_offres', '2020-02-10 06:16:15', '2020-02-10 06:16:16'),
(322, 'publish_articles', 'articles', '2020-02-10 06:16:29', '2020-02-10 06:16:31'),
(324, 'publish_contacts', 'contacts', '2020-02-10 06:17:23', '2020-02-10 06:17:24'),
(325, 'publish_evenements', 'evenements', '2020-02-10 06:17:42', '2020-02-10 06:17:43'),
(326, 'publish_galleries', 'galleries', '2020-02-10 06:18:05', '2020-02-10 06:18:06'),
(327, 'publish_liens', 'liens', '2020-02-10 06:18:22', '2020-02-10 06:18:23'),
(328, 'publish_posts', 'posts', '2020-02-10 06:19:01', '2020-02-10 06:19:02'),
(329, 'publish_raccourci_rapides', 'raccourci_rapides', '2020-02-10 06:19:23', '2020-02-10 06:19:23'),
(330, 'publish_sites_utiles', 'sites_utiles', '2020-02-10 06:19:48', '2020-02-10 06:19:48'),
(331, 'publish_sliders', 'sliders', '2020-02-10 06:20:12', '2020-02-10 06:20:14'),
(332, 'publish_statistiques', 'statistiques', '2020-02-10 06:20:56', '2020-02-10 06:20:57'),
(333, 'publish_themes', 'themes', '2020-02-10 06:21:17', '2020-02-10 06:21:18'),
(334, 'publish_types', 'types', '2020-02-10 06:21:39', '2020-02-10 06:21:39'),
(341, 'browse_demandeacces', 'demandeacces', '2020-02-28 04:51:52', '2020-02-28 04:51:52'),
(342, 'read_demandeacces', 'demandeacces', '2020-02-28 04:51:52', '2020-02-28 04:51:52'),
(343, 'edit_demandeacces', 'demandeacces', '2020-02-28 04:51:52', '2020-02-28 04:51:52'),
(344, 'add_demandeacces', 'demandeacces', '2020-02-28 04:51:52', '2020-02-28 04:51:52'),
(345, 'delete_demandeacces', 'demandeacces', '2020-02-28 04:51:52', '2020-02-28 04:51:52'),
(346, 'publish_demandeacces', 'demandeacces', '2020-02-28 04:51:52', '2020-02-28 04:51:52'),
(347, 'browse_messages_prive', 'messages_prive', '2020-02-28 04:52:14', '2020-02-28 04:52:14'),
(348, 'read_messages_prive', 'messages_prive', '2020-02-28 04:52:14', '2020-02-28 04:52:14'),
(349, 'edit_messages_prive', 'messages_prive', '2020-02-28 04:52:14', '2020-02-28 04:52:14'),
(350, 'add_messages_prive', 'messages_prive', '2020-02-28 04:52:14', '2020-02-28 04:52:14'),
(351, 'delete_messages_prive', 'messages_prive', '2020-02-28 04:52:14', '2020-02-28 04:52:14'),
(352, 'publish_messages_prive', 'messages_prive', '2020-02-28 04:52:14', '2020-02-28 04:52:14'),
(353, 'browse_reclamation', 'reclamation', '2020-02-28 04:52:34', '2020-02-28 04:52:34'),
(354, 'read_reclamation', 'reclamation', '2020-02-28 04:52:34', '2020-02-28 04:52:34'),
(355, 'edit_reclamation', 'reclamation', '2020-02-28 04:52:34', '2020-02-28 04:52:34'),
(356, 'add_reclamation', 'reclamation', '2020-02-28 04:52:34', '2020-02-28 04:52:34'),
(357, 'delete_reclamation', 'reclamation', '2020-02-28 04:52:34', '2020-02-28 04:52:34'),
(358, 'publish_reclamation', 'reclamation', '2020-02-28 04:52:34', '2020-02-28 04:52:34'),
(365, 'browse_reponse_messages_prive', 'reponse_messages_prive', '2020-02-28 04:52:58', '2020-02-28 04:52:58'),
(366, 'read_reponse_messages_prive', 'reponse_messages_prive', '2020-02-28 04:52:58', '2020-02-28 04:52:58'),
(367, 'edit_reponse_messages_prive', 'reponse_messages_prive', '2020-02-28 04:52:58', '2020-02-28 04:52:58'),
(368, 'add_reponse_messages_prive', 'reponse_messages_prive', '2020-02-28 04:52:58', '2020-02-28 04:52:58'),
(369, 'delete_reponse_messages_prive', 'reponse_messages_prive', '2020-02-28 04:52:58', '2020-02-28 04:52:58'),
(370, 'publish_reponse_messages_prive', 'reponse_messages_prive', '2020-02-28 04:52:58', '2020-02-28 04:52:58'),
(371, 'browse_reponse_reclamation', 'reponse_reclamation', '2020-02-28 04:53:09', '2020-02-28 04:53:09'),
(372, 'read_reponse_reclamation', 'reponse_reclamation', '2020-02-28 04:53:09', '2020-02-28 04:53:09'),
(373, 'edit_reponse_reclamation', 'reponse_reclamation', '2020-02-28 04:53:09', '2020-02-28 04:53:09'),
(374, 'add_reponse_reclamation', 'reponse_reclamation', '2020-02-28 04:53:09', '2020-02-28 04:53:09'),
(375, 'delete_reponse_reclamation', 'reponse_reclamation', '2020-02-28 04:53:09', '2020-02-28 04:53:09'),
(376, 'publish_reponse_reclamation', 'reponse_reclamation', '2020-02-28 04:53:09', '2020-02-28 04:53:09'),
(377, 'browse_citoyen', 'citoyen', '2020-02-28 05:32:22', '2020-02-28 05:32:22'),
(378, 'read_citoyen', 'citoyen', '2020-02-28 05:32:22', '2020-02-28 05:32:22'),
(379, 'edit_citoyen', 'citoyen', '2020-02-28 05:32:22', '2020-02-28 05:32:22'),
(380, 'add_citoyen', 'citoyen', '2020-02-28 05:32:22', '2020-02-28 05:32:22'),
(381, 'delete_citoyen', 'citoyen', '2020-02-28 05:32:22', '2020-02-28 05:32:22'),
(382, 'publish_citoyen', 'citoyen', '2020-02-28 05:32:22', '2020-02-28 05:32:22'),
(383, 'browse_citoyens', 'citoyens', '2020-02-28 05:45:25', '2020-02-28 05:45:25'),
(384, 'read_citoyens', 'citoyens', '2020-02-28 05:45:25', '2020-02-28 05:45:25'),
(385, 'edit_citoyens', 'citoyens', '2020-02-28 05:45:25', '2020-02-28 05:45:25'),
(386, 'add_citoyens', 'citoyens', '2020-02-28 05:45:25', '2020-02-28 05:45:25'),
(387, 'delete_citoyens', 'citoyens', '2020-02-28 05:45:25', '2020-02-28 05:45:25'),
(388, 'publish_citoyens', 'citoyens', '2020-02-28 05:45:25', '2020-02-28 05:45:25'),
(389, 'browse_demande_acces', 'demande_acces', '2020-02-28 05:49:33', '2020-02-28 05:49:33'),
(390, 'read_demande_acces', 'demande_acces', '2020-02-28 05:49:33', '2020-02-28 05:49:33'),
(391, 'edit_demande_acces', 'demande_acces', '2020-02-28 05:49:33', '2020-02-28 05:49:33'),
(392, 'add_demande_acces', 'demande_acces', '2020-02-28 05:49:33', '2020-02-28 05:49:33'),
(393, 'delete_demande_acces', 'demande_acces', '2020-02-28 05:49:33', '2020-02-28 05:49:33'),
(394, 'publish_demande_acces', 'demande_acces', '2020-02-28 05:49:33', '2020-02-28 05:49:33'),
(401, 'browse_reclamations', 'reclamations', '2020-02-28 06:06:41', '2020-02-28 06:06:41'),
(402, 'read_reclamations', 'reclamations', '2020-02-28 06:06:41', '2020-02-28 06:06:41'),
(403, 'edit_reclamations', 'reclamations', '2020-02-28 06:06:41', '2020-02-28 06:06:41'),
(404, 'add_reclamations', 'reclamations', '2020-02-28 06:06:41', '2020-02-28 06:06:41'),
(405, 'delete_reclamations', 'reclamations', '2020-02-28 06:06:41', '2020-02-28 06:06:41'),
(406, 'publish_reclamations', 'reclamations', '2020-02-28 06:06:41', '2020-02-28 06:06:41'),
(413, 'browse_messages_privates', 'messages_privates', '2020-02-28 06:39:08', '2020-02-28 06:39:08'),
(414, 'read_messages_privates', 'messages_privates', '2020-02-28 06:39:08', '2020-02-28 06:39:08'),
(415, 'edit_messages_privates', 'messages_privates', '2020-02-28 06:39:08', '2020-02-28 06:39:08'),
(416, 'add_messages_privates', 'messages_privates', '2020-02-28 06:39:08', '2020-02-28 06:39:08'),
(417, 'delete_messages_privates', 'messages_privates', '2020-02-28 06:39:08', '2020-02-28 06:39:08'),
(418, 'publish_messages_privates', 'messages_privates', '2020-02-28 06:39:08', '2020-02-28 06:39:08'),
(437, 'browse_pub_recherches', 'pub_recherches', '2020-03-18 06:09:54', '2020-03-18 06:09:54'),
(438, 'read_pub_recherches', 'pub_recherches', '2020-03-18 06:09:54', '2020-03-18 06:09:54'),
(439, 'edit_pub_recherches', 'pub_recherches', '2020-03-18 06:09:54', '2020-03-18 06:09:54'),
(440, 'add_pub_recherches', 'pub_recherches', '2020-03-18 06:09:54', '2020-03-18 06:09:54'),
(441, 'delete_pub_recherches', 'pub_recherches', '2020-03-18 06:09:54', '2020-03-18 06:09:54'),
(442, 'publish_pub_recherches', 'pub_recherches', '2020-03-18 06:09:54', '2020-03-18 06:09:54'),
(443, 'browse_demande_docs', 'demande_docs', '2020-04-08 07:13:20', '2020-04-08 07:13:20'),
(444, 'read_demande_docs', 'demande_docs', '2020-04-08 07:13:20', '2020-04-08 07:13:20'),
(445, 'edit_demande_docs', 'demande_docs', '2020-04-08 07:13:20', '2020-04-08 07:13:20'),
(446, 'add_demande_docs', 'demande_docs', '2020-04-08 07:13:20', '2020-04-08 07:13:20'),
(447, 'delete_demande_docs', 'demande_docs', '2020-04-08 07:13:20', '2020-04-08 07:13:20'),
(448, 'publish_demande_docs', 'demande_docs', '2020-04-08 07:13:20', '2020-04-08 07:13:20'),
(449, 'browse_type_docs', 'type_docs', '2020-04-09 08:15:28', '2020-04-09 08:15:28'),
(450, 'read_type_docs', 'type_docs', '2020-04-09 08:15:28', '2020-04-09 08:15:28'),
(451, 'edit_type_docs', 'type_docs', '2020-04-09 08:15:28', '2020-04-09 08:15:28'),
(452, 'add_type_docs', 'type_docs', '2020-04-09 08:15:28', '2020-04-09 08:15:28'),
(453, 'delete_type_docs', 'type_docs', '2020-04-09 08:15:28', '2020-04-09 08:15:28'),
(454, 'publish_type_docs', 'type_docs', '2020-04-09 08:15:28', '2020-04-09 08:15:28'),
(467, 'browse_accueil_composants', 'accueil_composants', '2020-05-11 08:58:37', '2020-05-11 08:58:37'),
(468, 'read_accueil_composants', 'accueil_composants', '2020-05-11 08:58:37', '2020-05-11 08:58:37'),
(469, 'edit_accueil_composants', 'accueil_composants', '2020-05-11 08:58:37', '2020-05-11 08:58:37'),
(470, 'add_accueil_composants', 'accueil_composants', '2020-05-11 08:58:37', '2020-05-11 08:58:37'),
(471, 'delete_accueil_composants', 'accueil_composants', '2020-05-11 08:58:37', '2020-05-11 08:58:37'),
(472, 'publish_accueil_composants', 'accueil_composants', '2020-05-11 08:58:37', '2020-05-11 08:58:37'),
(473, 'browse_polls', 'polls', '2020-05-18 13:21:43', '2020-05-18 13:21:43'),
(474, 'read_polls', 'polls', '2020-05-18 13:21:43', '2020-05-18 13:21:43'),
(475, 'edit_polls', 'polls', '2020-05-18 13:21:44', '2020-05-18 13:21:44'),
(476, 'add_polls', 'polls', '2020-05-18 13:21:44', '2020-05-18 13:21:44'),
(477, 'delete_polls', 'polls', '2020-05-18 13:21:44', '2020-05-18 13:21:44'),
(496, 'browse_denonciations', 'denonciations', '2020-06-24 10:15:57', '2020-06-24 10:15:57'),
(497, 'read_denonciations', 'denonciations', '2020-06-24 10:15:57', '2020-06-24 10:15:57'),
(498, 'edit_denonciations', 'denonciations', '2020-06-24 10:15:57', '2020-06-24 10:15:57'),
(499, 'add_denonciations', 'denonciations', '2020-06-24 10:15:57', '2020-06-24 10:15:57'),
(500, 'delete_denonciations', 'denonciations', '2020-06-24 10:15:57', '2020-06-24 10:15:57'),
(501, 'publish_denonciations', 'denonciations', '2020-06-24 10:15:57', '2020-06-24 10:15:57'),
(502, 'browse_abonnes', 'abonnes', '2020-07-06 10:10:32', '2020-07-06 10:10:32'),
(503, 'read_abonnes', 'abonnes', '2020-07-06 10:10:32', '2020-07-06 10:10:32'),
(504, 'edit_abonnes', 'abonnes', '2020-07-06 10:10:32', '2020-07-06 10:10:32'),
(505, 'add_abonnes', 'abonnes', '2020-07-06 10:10:32', '2020-07-06 10:10:32'),
(506, 'delete_abonnes', 'abonnes', '2020-07-06 10:10:32', '2020-07-06 10:10:32'),
(507, 'publish_abonnes', 'abonnes', '2020-07-06 10:10:32', '2020-07-06 10:10:32'),
(508, 'browse_messagenewsletters', 'messagenewsletters', '2020-07-09 08:07:15', '2020-07-09 08:07:15'),
(509, 'read_messagenewsletters', 'messagenewsletters', '2020-07-09 08:07:15', '2020-07-09 08:07:15'),
(510, 'edit_messagenewsletters', 'messagenewsletters', '2020-07-09 08:07:15', '2020-07-09 08:07:15'),
(511, 'add_messagenewsletters', 'messagenewsletters', '2020-07-09 08:07:15', '2020-07-09 08:07:15'),
(512, 'delete_messagenewsletters', 'messagenewsletters', '2020-07-09 08:07:15', '2020-07-09 08:07:15'),
(513, 'publish_messagenewsletters', 'messagenewsletters', '2020-07-09 08:07:15', '2020-07-09 08:07:15'),
(514, 'browse_annuaire_etablissements', 'annuaire_etablissements', '2020-08-04 09:20:37', '2020-08-04 09:20:37'),
(515, 'read_annuaire_etablissements', 'annuaire_etablissements', '2020-08-04 09:20:37', '2020-08-04 09:20:37'),
(516, 'edit_annuaire_etablissements', 'annuaire_etablissements', '2020-08-04 09:20:37', '2020-08-04 09:20:37'),
(517, 'add_annuaire_etablissements', 'annuaire_etablissements', '2020-08-04 09:20:37', '2020-08-04 09:20:37'),
(518, 'delete_annuaire_etablissements', 'annuaire_etablissements', '2020-08-04 09:20:37', '2020-08-04 09:20:37'),
(519, 'publish_annuaire_etablissements', 'annuaire_etablissements', '2020-08-04 09:20:37', '2020-08-04 09:20:37'),
(520, 'browse_cooperations', 'cooperations', '2020-08-04 09:20:53', '2020-08-04 09:20:53'),
(521, 'read_cooperations', 'cooperations', '2020-08-04 09:20:53', '2020-08-04 09:20:53'),
(522, 'edit_cooperations', 'cooperations', '2020-08-04 09:20:53', '2020-08-04 09:20:53'),
(523, 'add_cooperations', 'cooperations', '2020-08-04 09:20:53', '2020-08-04 09:20:53'),
(524, 'delete_cooperations', 'cooperations', '2020-08-04 09:20:53', '2020-08-04 09:20:53'),
(525, 'publish_cooperations', 'cooperations', '2020-08-04 09:20:53', '2020-08-04 09:20:53'),
(526, 'browse_budget_partcipatifs', 'budget_partcipatifs', '2020-08-04 10:50:47', '2020-08-04 10:50:47'),
(527, 'read_budget_partcipatifs', 'budget_partcipatifs', '2020-08-04 10:50:47', '2020-08-04 10:50:47'),
(528, 'edit_budget_partcipatifs', 'budget_partcipatifs', '2020-08-04 10:50:47', '2020-08-04 10:50:47'),
(529, 'add_budget_partcipatifs', 'budget_partcipatifs', '2020-08-04 10:50:47', '2020-08-04 10:50:47'),
(530, 'delete_budget_partcipatifs', 'budget_partcipatifs', '2020-08-04 10:50:47', '2020-08-04 10:50:47'),
(531, 'publish_budget_partcipatifs', 'budget_partcipatifs', '2020-08-04 10:50:47', '2020-08-04 10:50:47'),
(532, 'browse_conseil_municipales', 'conseil_municipales', '2020-08-04 10:53:47', '2020-08-04 10:53:47'),
(533, 'read_conseil_municipales', 'conseil_municipales', '2020-08-04 10:53:47', '2020-08-04 10:53:47'),
(534, 'edit_conseil_municipales', 'conseil_municipales', '2020-08-04 10:53:47', '2020-08-04 10:53:47'),
(535, 'add_conseil_municipales', 'conseil_municipales', '2020-08-04 10:53:47', '2020-08-04 10:53:47'),
(536, 'delete_conseil_municipales', 'conseil_municipales', '2020-08-04 10:53:47', '2020-08-04 10:53:47'),
(537, 'publish_conseil_municipales', 'conseil_municipales', '2020-08-04 10:53:47', '2020-08-04 10:53:47'),
(538, 'browse_finances', 'finances', '2020-08-04 10:54:10', '2020-08-04 10:54:10'),
(539, 'read_finances', 'finances', '2020-08-04 10:54:10', '2020-08-04 10:54:10'),
(540, 'edit_finances', 'finances', '2020-08-04 10:54:10', '2020-08-04 10:54:10'),
(541, 'add_finances', 'finances', '2020-08-04 10:54:10', '2020-08-04 10:54:10'),
(542, 'delete_finances', 'finances', '2020-08-04 10:54:10', '2020-08-04 10:54:10'),
(543, 'publish_finances', 'finances', '2020-08-04 10:54:10', '2020-08-04 10:54:10'),
(544, 'browse_projets_realisations', 'projets_realisations', '2020-08-04 10:54:32', '2020-08-04 10:54:32'),
(545, 'read_projets_realisations', 'projets_realisations', '2020-08-04 10:54:32', '2020-08-04 10:54:32'),
(546, 'edit_projets_realisations', 'projets_realisations', '2020-08-04 10:54:32', '2020-08-04 10:54:32'),
(547, 'add_projets_realisations', 'projets_realisations', '2020-08-04 10:54:32', '2020-08-04 10:54:32'),
(548, 'delete_projets_realisations', 'projets_realisations', '2020-08-04 10:54:32', '2020-08-04 10:54:32'),
(549, 'publish_projets_realisations', 'projets_realisations', '2020-08-04 10:54:32', '2020-08-04 10:54:32'),
(562, 'browse_articles_travaux_associations', 'articles_travaux_associations', '2020-08-05 08:08:20', '2020-08-05 08:08:20'),
(563, 'read_articles_travaux_associations', 'articles_travaux_associations', '2020-08-05 08:08:20', '2020-08-05 08:08:20'),
(564, 'edit_articles_travaux_associations', 'articles_travaux_associations', '2020-08-05 08:08:20', '2020-08-05 08:08:20'),
(565, 'add_articles_travaux_associations', 'articles_travaux_associations', '2020-08-05 08:08:20', '2020-08-05 08:08:20'),
(566, 'delete_articles_travaux_associations', 'articles_travaux_associations', '2020-08-05 08:08:20', '2020-08-05 08:08:20'),
(567, 'publish_articles_travaux_associations', 'articles_travaux_associations', '2020-08-05 08:08:20', '2020-08-05 08:08:20'),
(568, 'browse_protection_socio_enviros', 'protection_socio_enviros', '2020-08-05 08:53:18', '2020-08-05 08:53:18'),
(569, 'read_protection_socio_enviros', 'protection_socio_enviros', '2020-08-05 08:53:18', '2020-08-05 08:53:18'),
(570, 'edit_protection_socio_enviros', 'protection_socio_enviros', '2020-08-05 08:53:18', '2020-08-05 08:53:18'),
(571, 'add_protection_socio_enviros', 'protection_socio_enviros', '2020-08-05 08:53:18', '2020-08-05 08:53:18'),
(572, 'delete_protection_socio_enviros', 'protection_socio_enviros', '2020-08-05 08:53:18', '2020-08-05 08:53:18'),
(573, 'publish_protection_socio_enviros', 'protection_socio_enviros', '2020-08-05 08:53:18', '2020-08-05 08:53:18');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(4, 3),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(31, 1),
(31, 2),
(31, 3),
(32, 1),
(32, 2),
(32, 3),
(33, 1),
(33, 2),
(33, 3),
(34, 1),
(34, 2),
(34, 3),
(35, 1),
(35, 2),
(41, 1),
(42, 1),
(42, 2),
(42, 3),
(43, 1),
(43, 2),
(43, 3),
(44, 1),
(44, 2),
(44, 3),
(45, 1),
(45, 2),
(45, 3),
(46, 1),
(46, 2),
(67, 1),
(67, 2),
(67, 3),
(68, 1),
(68, 2),
(68, 3),
(69, 1),
(69, 2),
(69, 3),
(70, 1),
(70, 2),
(70, 3),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(72, 3),
(73, 1),
(73, 2),
(73, 3),
(74, 1),
(74, 2),
(74, 3),
(75, 1),
(75, 2),
(75, 3),
(76, 1),
(76, 2),
(92, 1),
(92, 2),
(93, 1),
(93, 2),
(94, 1),
(94, 2),
(95, 1),
(95, 2),
(96, 1),
(96, 2),
(97, 1),
(97, 2),
(97, 3),
(98, 1),
(98, 2),
(98, 3),
(99, 1),
(99, 2),
(99, 3),
(100, 1),
(100, 2),
(100, 3),
(101, 1),
(101, 2),
(112, 1),
(112, 2),
(112, 3),
(113, 1),
(113, 2),
(113, 3),
(114, 1),
(114, 2),
(114, 3),
(115, 1),
(115, 2),
(115, 3),
(116, 1),
(116, 2),
(172, 1),
(172, 2),
(172, 3),
(173, 1),
(173, 2),
(173, 3),
(174, 1),
(174, 2),
(174, 3),
(175, 1),
(175, 2),
(175, 3),
(176, 1),
(176, 2),
(192, 1),
(192, 2),
(192, 3),
(193, 1),
(193, 2),
(193, 3),
(194, 1),
(194, 2),
(194, 3),
(195, 1),
(195, 2),
(195, 3),
(196, 1),
(196, 2),
(207, 1),
(207, 2),
(207, 3),
(208, 1),
(208, 2),
(208, 3),
(209, 1),
(209, 2),
(209, 3),
(210, 1),
(210, 2),
(210, 3),
(211, 1),
(211, 2),
(237, 1),
(237, 2),
(237, 3),
(238, 1),
(238, 2),
(238, 3),
(239, 1),
(239, 2),
(239, 3),
(240, 1),
(240, 2),
(240, 3),
(241, 1),
(241, 2),
(247, 1),
(247, 2),
(247, 3),
(248, 1),
(248, 2),
(248, 3),
(249, 1),
(249, 2),
(249, 3),
(250, 1),
(250, 2),
(250, 3),
(251, 1),
(251, 2),
(267, 1),
(267, 2),
(267, 3),
(268, 1),
(268, 2),
(268, 3),
(269, 1),
(269, 2),
(269, 3),
(270, 1),
(270, 2),
(270, 3),
(271, 1),
(271, 2),
(292, 1),
(292, 2),
(292, 3),
(293, 1),
(293, 2),
(293, 3),
(294, 1),
(294, 2),
(294, 3),
(295, 1),
(295, 2),
(295, 3),
(296, 1),
(296, 2),
(319, 1),
(319, 2),
(321, 1),
(321, 2),
(322, 1),
(322, 2),
(324, 1),
(324, 2),
(325, 1),
(325, 2),
(326, 1),
(326, 2),
(327, 1),
(327, 2),
(328, 1),
(328, 2),
(329, 1),
(329, 2),
(330, 1),
(330, 2),
(331, 1),
(331, 2),
(332, 1),
(332, 2),
(333, 1),
(333, 2),
(334, 1),
(334, 2),
(341, 1),
(342, 1),
(343, 1),
(344, 1),
(345, 1),
(346, 1),
(347, 1),
(348, 1),
(349, 1),
(350, 1),
(351, 1),
(352, 1),
(353, 1),
(354, 1),
(355, 1),
(356, 1),
(357, 1),
(358, 1),
(365, 1),
(366, 1),
(367, 1),
(368, 1),
(369, 1),
(370, 1),
(371, 1),
(372, 1),
(373, 1),
(374, 1),
(375, 1),
(376, 1),
(377, 1),
(378, 1),
(379, 1),
(380, 1),
(381, 1),
(382, 1),
(383, 1),
(384, 1),
(385, 1),
(386, 1),
(387, 1),
(388, 1),
(389, 1),
(390, 1),
(391, 1),
(392, 1),
(393, 1),
(394, 1),
(401, 1),
(402, 1),
(403, 1),
(404, 1),
(405, 1),
(406, 1),
(413, 1),
(414, 1),
(415, 1),
(416, 1),
(417, 1),
(418, 1),
(437, 1),
(438, 1),
(439, 1),
(440, 1),
(441, 1),
(442, 1),
(443, 1),
(444, 1),
(445, 1),
(446, 1),
(447, 1),
(448, 1),
(449, 1),
(450, 1),
(451, 1),
(452, 1),
(453, 1),
(454, 1),
(467, 1),
(468, 1),
(469, 1),
(470, 1),
(471, 1),
(472, 1),
(473, 1),
(474, 1),
(475, 1),
(476, 1),
(477, 1),
(496, 1),
(497, 1),
(498, 1),
(499, 1),
(500, 1),
(501, 1),
(502, 1),
(503, 1),
(504, 1),
(505, 1),
(506, 1),
(507, 1),
(508, 1),
(509, 1),
(510, 1),
(511, 1),
(512, 1),
(513, 1),
(514, 1),
(515, 1),
(516, 1),
(517, 1),
(518, 1),
(519, 1),
(520, 1),
(521, 1),
(522, 1),
(523, 1),
(524, 1),
(525, 1),
(526, 1),
(527, 1),
(528, 1),
(529, 1),
(530, 1),
(531, 1),
(532, 1),
(533, 1),
(534, 1),
(535, 1),
(536, 1),
(537, 1),
(538, 1),
(539, 1),
(540, 1),
(541, 1),
(542, 1),
(543, 1),
(544, 1),
(545, 1),
(546, 1),
(547, 1),
(548, 1),
(549, 1),
(562, 1),
(563, 1),
(564, 1),
(565, 1),
(566, 1),
(567, 1),
(568, 1),
(569, 1),
(570, 1),
(571, 1),
(572, 1),
(573, 1);

-- --------------------------------------------------------

--
-- Structure de la table `permis_batir`
--

CREATE TABLE `permis_batir` (
  `Id_permis` int(11) NOT NULL,
  `date_permis` date NOT NULL,
  `situation` varchar(20) NOT NULL,
  `Remarque` text NOT NULL,
  `num_permis` int(11) NOT NULL,
  `cin` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `projets_realisations`
--

CREATE TABLE `projets_realisations` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Annee` int(11) DEFAULT NULL,
  `titre_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TypeProjet` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Document` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` longtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `protection_socio_enviros`
--

CREATE TABLE `protection_socio_enviros` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Annee` int(11) DEFAULT NULL,
  `TitreAR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Document` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TitreFR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `raccourci_rapides`
--

CREATE TABLE `raccourci_rapides` (
  `id` int(10) UNSIGNED NOT NULL,
  `titre_fr` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `titre_ar` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `titre_en` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lien` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nv_onglet` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `icone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `creerPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifierPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `raccourci_rapides`
--

INSERT INTO `raccourci_rapides` (`id`, `titre_fr`, `titre_ar`, `titre_en`, `lien`, `deleted_at`, `created_at`, `updated_at`, `nv_onglet`, `icone`, `color`, `creerPar`, `modifierPar`, `approuverPar`, `approuverLe`, `depublierLe`, `status`) VALUES
(5, 'Demande d\'accès aux documents administratifs', 'مطلب نفاذ إلى وثيقة إدارية', NULL, '/public/storage/Documents/demade-acces.pdf', NULL, '2019-11-05 10:39:03', '2019-12-13 15:27:48', '_blank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Loi fondamentale n°75-33 du 14 Mai 1975 pour les municipalités', 'قانون أساسي عدد 33-75 مؤرخ في 14 ماي 1975', NULL, '/public/storage/Documents/Loi-n-75-33-du-14-Mai-1975-Ar.pdf', NULL, '2019-11-05 10:39:37', '2019-12-13 15:27:26', '_blank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Guide d\'état civil', 'النصوص التشريعية و الترتيبية المتعلقة بالحالة المدنية', NULL, '#', NULL, '2019-11-08 14:07:47', '2019-11-08 14:07:47', '_blank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Pétition chez le chef  structure', 'تظلم لدى رئيس الهيئة', NULL, '/public/storage/Documents/petition-chef-str.pdf', NULL, '2019-11-08 14:09:55', '2019-12-13 15:27:05', '_blank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Cadre juridique lois-2018', 'قوانين الإطار القانوني 2018', NULL, '/storage/Documents/cadre-juridique-lois-2018.pdf', NULL, '2020-01-24 08:37:07', '2020-01-24 08:37:14', '_blank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reclamations`
--

CREATE TABLE `reclamations` (
  `id` int(10) UNSIGNED NOT NULL,
  `CodeReclamation` varchar(255) NOT NULL,
  `Sujet` varchar(255) NOT NULL,
  `Textmessage` text DEFAULT NULL,
  `IdCitoyen` int(11) NOT NULL,
  `Etat` int(11) DEFAULT NULL,
  `DateReclamation` datetime DEFAULT NULL,
  `Priorite` varchar(255) DEFAULT NULL,
  `PiecesJointes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `creerPar` varchar(255) DEFAULT NULL,
  `modifierPar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reclamations`
--

INSERT INTO `reclamations` (`id`, `CodeReclamation`, `Sujet`, `Textmessage`, `IdCitoyen`, `Etat`, `DateReclamation`, `Priorite`, `PiecesJointes`, `created_at`, `updated_at`, `deleted_at`, `creerPar`, `modifierPar`) VALUES
(27, '#2020-0027', 'شكوى حول موضوع معين', '<p dir=\"rtl\">لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق &quot;ليتراسيت&quot; (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل &quot;ألدوس بايج مايكر&quot; (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.</p>', 3, 0, '2020-06-10 09:54:03', 'haute', NULL, '2020-06-10 08:54:03', '2020-06-10 08:54:03', NULL, NULL, NULL),
(28, '#2020-0028', 'شكوى حول موضوع معين 2', '<p>Le&nbsp;<strong>Lorem Ipsum</strong>&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l&#39;imprimerie depuis les ann&eacute;es 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour r&eacute;aliser un livre sp&eacute;cimen de polices de texte. Il n&#39;a pas fait que survivre cinq si&egrave;cles, mais s&#39;est aussi adapt&eacute; &agrave; la bureautique informatique, sans que son contenu n&#39;en soit modifi&eacute;. Il a &eacute;t&eacute; popularis&eacute; dans les ann&eacute;es 1960 gr&acirc;ce &agrave; la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus r&eacute;cemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.</p>', 3, 0, '2020-06-10 09:56:10', 'moyenne', NULL, '2020-06-10 08:56:10', '2020-06-10 08:56:10', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reponse_demande_acces`
--

CREATE TABLE `reponse_demande_acces` (
  `id` int(10) UNSIGNED NOT NULL,
  `Id_demandeacces` int(11) NOT NULL,
  `TextReponse` text DEFAULT NULL,
  `Expediteur` varchar(255) NOT NULL,
  `DateReponse` datetime DEFAULT NULL,
  `PiecesJointes` text DEFAULT NULL,
  `Lu` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reponse_messages_privates`
--

CREATE TABLE `reponse_messages_privates` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_message_prive` int(11) NOT NULL,
  `TextReponse` text DEFAULT NULL,
  `Expediteur` varchar(255) DEFAULT NULL,
  `DateReponse` datetime DEFAULT NULL,
  `PiecesJointes` text DEFAULT NULL,
  `Lu` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reponse_reclamations`
--

CREATE TABLE `reponse_reclamations` (
  `id` int(10) UNSIGNED NOT NULL,
  `Id_reclamation` int(11) NOT NULL,
  `TextReponse` text DEFAULT NULL,
  `Expediteur` varchar(255) NOT NULL,
  `DateReponse` datetime DEFAULT NULL,
  `PiecesJointes` text DEFAULT NULL,
  `Lu` bit(1) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reseau_sociales`
--

CREATE TABLE `reseau_sociales` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nv_onglet_facebook` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `nv_onglet_twitter` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `nv_onglet_google_plus` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `nv_onglet_linkedin` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `nv_onglet_youtube` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `reseau_sociales`
--

INSERT INTO `reseau_sociales` (`id`, `facebook`, `deleted_at`, `created_at`, `updated_at`, `twitter`, `google_plus`, `linkedin`, `youtube`, `nv_onglet_facebook`, `nv_onglet_twitter`, `nv_onglet_google_plus`, `nv_onglet_linkedin`, `nv_onglet_youtube`) VALUES
(1, 'https://fr-fr.facebook.com/', '2019-11-13 10:43:00', '2019-11-13 09:40:00', '2019-11-13 09:44:42', 'https://twitter.com/?lang=fr', 'https://twitter.com/?lang=fr', 'https://twitter.com/?lang=fr', 'https://twitter.com/?lang=fr', '_blank', '_blank', '_blank', '_blank', '_blank');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrateur', '2019-07-23 04:29:15', '2020-02-10 06:36:43'),
(2, 'editor', 'Éditeur', '2019-07-23 04:29:15', '2020-02-10 06:39:10'),
(3, 'writer', 'Rédacteur', '2020-02-10 06:43:35', '2020-02-10 06:43:35');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom_service_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_service_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_service_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Titre', 'Commune Beni mtir', '', 'text', 1, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 5, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Portail web', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'CPanel Portail de la commune de  Aousja', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.site_facebook', 'Facebook', 'https://www.facebook.com', NULL, 'text', 6, 'Site'),
(12, 'site.site_youtube', 'YouTube', 'https://www.youtube.com/', NULL, 'text', 7, 'Site'),
(13, 'site.site_twitter', 'Twitter', NULL, NULL, 'text', 8, 'Site'),
(17, 'site.site_email', 'Email', 'contact@commune-benimtir.tn', NULL, 'text', 11, 'Site'),
(19, 'site.site_adresse', 'Adresse', 'Av.Habib Bourguiba, 7014 Aousja', NULL, 'text', 13, 'Site'),
(23, 'site.site_logoLg_ar', 'Logo LG AR', 'settings\\July2023\\QMiB8G2DTnoXnSwhLexr.png', NULL, 'image', 14, 'Site'),
(24, 'site.sire_logoSm_ar', 'Logo SM AR', 'settings\\October2022\\ILljzCCDwUxjzh1Yyuvn.png', NULL, 'image', 16, 'Site'),
(25, 'site.site_tel', 'Tél', NULL, NULL, 'text', 17, 'Site'),
(26, 'site.site_fax', 'Fax', NULL, NULL, 'text', 18, 'Site'),
(27, 'site.site_adresse_ar', 'Adresse Ar', NULL, NULL, 'text', 19, 'Site'),
(28, 'site.site_adresse_fr', 'Adresse Fr', NULL, NULL, 'text', 20, 'Site'),
(29, 'site.site_adresse_en', 'Adresse En', NULL, NULL, 'text', 21, 'Site'),
(31, 'site.site_titre_ar', 'تسمية البوابة', 'بلدية بني مطير', NULL, 'text', 3, 'Site'),
(32, 'seo.site_keywords_fr', 'Site keyWords FR', 'يتيح الموقع الإلكتروني المجتمعي تعزيز البلدية وإجراءاتها ، وكذلك تقديم مواطنيها خدمة محلية ، مكملة لذلك المقترح في قاعة المدينة.\r\n\r\nوبالفعل ، فإن وجود موقع ويب مشترك يسمح بنشر معلومات بسيطة وأساسية للمواطنين: الحياة البلدية ، والخدمات ، والأعمال ، والترفيه ، والسياحة ... كما يتيح الوصول إلى الخدمات عبر الإنترنت المتاحة 7/7. / 24\r\n\r\nروابط مفيدة', NULL, 'text_area', 23, 'SEO'),
(33, 'seo.site_keywords_ar', 'Site keyWords AR', 'يتيح الموقع الإلكتروني المجتمعي تعزيز البلدية وإجراءاتها ، وكذلك تقديم مواطنيها خدمة محلية ، مكملة لذلك المقترح في قاعة المدينة.\r\n\r\nوبالفعل ، فإن وجود موقع ويب مشترك يسمح بنشر معلومات بسيطة وأساسية للمواطنين: الحياة البلدية ، والخدمات ، والأعمال ، والترفيه ، والسياحة ... كما يتيح الوصول إلى الخدمات عبر الإنترنت المتاحة 7/7. / 24\r\n\r\nروابط مفيدة', NULL, 'text_area', 22, 'SEO'),
(35, 'seo.site_description_ar', 'Site Description AR', 'يتيح الموقع الإلكتروني المجتمعي تعزيز البلدية وإجراءاتها ، وكذلك تقديم مواطنيها خدمة محلية ، مكملة لذلك المقترح في قاعة المدينة.\r\n\r\nوبالفعل ، فإن وجود موقع ويب مشترك يسمح بنشر معلومات بسيطة وأساسية للمواطنين: الحياة البلدية ، والخدمات ، والأعمال ، والترفيه ، والسياحة ... كما يتيح الوصول إلى الخدمات عبر الإنترنت المتاحة 7/7. / 24\r\n\r\nروابط مفيدة', NULL, 'text_area', 25, 'SEO'),
(36, 'seo.site_description_fr', 'Site Description FR', 'يتيح الموقع الإلكتروني المجتمعي تعزيز البلدية وإجراءاتها ، وكذلك تقديم مواطنيها خدمة محلية ، مكملة لذلك المقترح في قاعة المدينة.\r\n\r\nوبالفعل ، فإن وجود موقع ويب مشترك يسمح بنشر معلومات بسيطة وأساسية للمواطنين: الحياة البلدية ، والخدمات ، والأعمال ، والترفيه ، والسياحة ... كما يتيح الوصول إلى الخدمات عبر الإنترنت المتاحة 7/7. / 24\r\n\r\nروابط مفيدة', NULL, 'text_area', 26, 'SEO'),
(38, 'espace-prive.email_reclamation', 'Email responsable des réclamations', 'reclamation@gmail.com', NULL, 'text', 29, 'Espace privé'),
(39, 'espace-prive.nom_responsable_reclamation', 'Nom responsable des réclamations', 'Commune Aousja', NULL, 'text', 28, 'Espace privé'),
(40, 'site.site_logoLg_fr', 'Logo LG FR', 'settings\\October2022\\UA3A1v84nmE06JaQcm4Y.png', NULL, 'image', 14, 'Site'),
(41, 'site.sire_logoSm_fr', 'Logo SM FR', 'settings\\October2022\\8vPjQ8zIJgzVupOoCUGv.png', NULL, 'image', 16, 'Site'),
(43, 'site.site_logoLg_en', 'Logo LG EN', 'settings\\May2020\\tVOYKGln6DKv3hLBHk4F.png', NULL, 'image', 14, 'Site'),
(47, 'site-langue.site_langue_ar', 'Langue Ar', '1', NULL, 'checkbox', 30, 'Site Langue'),
(49, 'site-langue.site_langue_fr', 'Langue Fr', '1', NULL, 'checkbox', 32, 'Site Langue'),
(50, 'espace-prive.email_acces_docs', 'Email responsable d’accès aux documents administratifs', 'reclamation@gmail.com', NULL, 'text', 33, 'Espace privé'),
(51, 'espace-prive.nom_responsable_acces_docs', 'Nom responsable d’accès aux documents administratifs', 'Commune Aousja', NULL, 'text', 34, 'Espace privé'),
(52, 'espace-prive.nom_responsable_demandesDocs', 'Nom responsable des demandes docs', 'Commune Aousja', NULL, 'text', 35, 'Espace privé'),
(53, 'espace-prive.email_demandesDocs', 'Email responsable des demandes des docs', 'Commune Aousja', NULL, 'text', 36, 'Espace privé'),
(54, 'newsletters.email_newsletter', 'Email newsLetter', 'newsletter@commune-aousja.tn', NULL, 'text', 37, 'NewsLetters'),
(55, 'newsletters.nom_expediteur_newsletter', 'Nom affiché d\'éxpediteur', 'Commune Aousja', NULL, 'text', 38, 'NewsLetters');

-- --------------------------------------------------------

--
-- Structure de la table `sites_utiles`
--

CREATE TABLE `sites_utiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `titre_fr` varchar(255) DEFAULT NULL,
  `titre_ar` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `lien` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `titre_en` varchar(255) DEFAULT NULL,
  `creerPar` varchar(255) DEFAULT NULL,
  `modifierPar` varchar(255) DEFAULT NULL,
  `approuverPar` varchar(255) DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `texte` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `langue` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titre_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `creerPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifierPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sliders`
--

INSERT INTO `sliders` (`id`, `photo`, `texte`, `deleted_at`, `created_at`, `updated_at`, `langue`, `titre_fr`, `creerPar`, `modifierPar`, `approuverPar`, `approuverLe`, `depublierLe`, `status`) VALUES
(7, 'slider/1.jpg', NULL, NULL, '2022-10-25 15:05:21', '2023-06-05 12:29:40', 'TOUS', 'بلدية عوسجة', '1', '1', NULL, NULL, NULL, 'PUBLISHED'),
(8, 'slider/2.jpg', NULL, NULL, '2022-10-25 15:05:39', '2022-10-25 15:05:39', 'TOUS', 'بلدية عوسجة', '1', NULL, NULL, NULL, NULL, 'PUBLISHED'),
(9, 'slider1.jpg', NULL, NULL, '2022-10-25 15:05:56', '2023-06-05 12:24:36', 'TOUS', 'بلدية بني مطير', '1', '1', NULL, NULL, NULL, 'PUBLISHED');

-- --------------------------------------------------------

--
-- Structure de la table `statistiques`
--

CREATE TABLE `statistiques` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `Couleurs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AxeX` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `AxeY` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `Titre_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Titre_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Titre_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description_ar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description_en` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type_Stats` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ATTENTE',
  `featured` tinyint(4) DEFAULT NULL,
  `creerPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifierPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `statistiques`
--

INSERT INTO `statistiques` (`id`, `created_at`, `updated_at`, `deleted_at`, `Couleurs`, `AxeX`, `AxeY`, `Titre_fr`, `Titre_ar`, `Titre_en`, `Description_fr`, `Description_ar`, `Description_en`, `Type_Stats`, `seo_title`, `meta_description`, `meta_keywords`, `slug`, `status`, `featured`, `creerPar`, `modifierPar`, `approuverPar`, `approuverLe`, `depublierLe`) VALUES
(1, '2019-08-26 07:06:15', '2019-12-11 04:01:32', NULL, '[\"#ff8000\",\"#800080\",\"#000000\"]', '[\"2\",\"5\",\"5\"]', '[1,4,33]', 'Statistique 1', NULL, NULL, NULL, NULL, NULL, 'line', NULL, NULL, NULL, 'statistique-1', 'PUBLISHED', NULL, '1', NULL, NULL, NULL, NULL),
(4, '2019-12-11 05:36:10', '2019-12-13 04:51:10', NULL, '[\"#80ffff\",\"#00ff40\",\"#ff0000\"]', '[\"Janvier\",\"Février\",\"Mars\"]', '[8,6,5.6]', 'Statistique 2', NULL, NULL, '<p><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>', '<p dir=\"rtl\" style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">للمهتمين قمنا بوضع نص لوريم إبسوم القياسي والمُستخدم منذ القرن الخامس عشر في الأسفل. وتم أيضاً توفير الأقسام 1.10.32 و 1.10.33 من \"حول أقاصي الخير والشر\" (de Finibus Bonorum et Malorum) لمؤلفه شيشيرون (Cicero) بصيغها الأصلية، مرفقة بالنسخ الإنكليزية لها والتي قام بترجمتها هـ.راكهام (H. Rackham) في عام 1914.</p>', '<p><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span></p>', 'bar', NULL, NULL, NULL, 'statistique-2', 'ATTENTE', NULL, '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `themes`
--

CREATE TABLE `themes` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `texte_juridique_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `texte_juridique_ar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `texte_juridique_en` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ATTENTE',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `creerPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifierPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `themes`
--

INSERT INTO `themes` (`id`, `theme_fr`, `theme_ar`, `theme_en`, `deleted_at`, `created_at`, `updated_at`, `texte_juridique_fr`, `texte_juridique_ar`, `texte_juridique_en`, `seo_title`, `meta_description`, `meta_keywords`, `status`, `slug`, `featured`, `creerPar`, `modifierPar`, `approuverPar`, `approuverLe`, `depublierLe`) VALUES
(1, 'theme jurique 2', 'الموضوع القانوني 2', 'Legal topic 2', NULL, '2019-08-01 06:13:20', '2020-01-15 08:00:25', '<ul>\r\n<li><a title=\"dsfgdsgfdgdfgsdf\" href=\"/storage/th&egrave;mes/Description-charte%202.pdf\" target=\"_blank\" rel=\"noopener\">dsfgdsgfdgdfgsdf</a></li>\r\n</ul>', '<ul class=\"liste_circulaire_interne\" style=\"box-sizing: border-box; margin: 20px 0px 21px; list-style: none; padding: 0px; color: #0c1b20; font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: #fbfaf9;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\">\r\n<div dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Appel &agrave; candidature pour cr&eacute;ation de laboratoires et d\'unit&eacute;s de recherche au sein des instituts sup&eacute;rieurs pour le sport et l\'&eacute;ducation physique et d\'autres institutions de Minist&egrave;re de la jeunesse et des sports. Date limite de d&eacute;p&ocirc;t des demandes de laboratoires et d\' unit&eacute;s de recherche aupr&egrave;s des &eacute;tablissements :&nbsp;<span style=\"box-sizing: border-box; color: #ff0000;\">30 juin 2015</span></div>\r\n<div dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"box-sizing: border-box; margin: 0px; list-style: none; padding: 0px 0px 5px 9px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4457\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;31 (PDF)</a></li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><span style=\"box-sizing: border-box; background-color: initial;\">Formulaire Laboratoire de Recherche (2016-2019) (</span><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4460\" target=\"_blank\" rel=\"noopener\">Word</a><a style=\"box-sizing: border-box; background-color: initial; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4442\" target=\"_blank\" rel=\"noopener\">&nbsp;</a><span style=\"box-sizing: border-box; background-color: initial;\">-&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4461\" target=\"_blank\" rel=\"noopener\">PDF</a>)</span></li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\">Formulaire Unit&eacute; de Recherche (2016-2018) (<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4462\" target=\"_blank\" rel=\"noopener\">Word</a><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4445\" target=\"_blank\" rel=\"noopener\">&nbsp;</a>-&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4463\" target=\"_blank\" rel=\"noopener\">PDF</a>)</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4459\" target=\"_blank\" rel=\"noopener\">D&eacute;cret n&deg;2009-644 du 2 mars 2009, fixant l\'organisation et les modalit&eacute;s de fonctionnement des laboratoires de recherche, des unit&eacute;s de recherche et des consortiums de recherche(Pdf).</a></li>\r\n</ul>\r\n</div>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><img style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"box-sizing: border-box; background-color: transparent; color: #000000; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-family: Georgia, \'Times New Roman\', Times, serif; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;28 :&nbsp;</a>Appel &agrave; candidature pour la cr&eacute;ation des laboratoires &nbsp;de recherche&nbsp;et des unit&eacute;s de recherche au sein des institutions d\'enseignement sup&eacute;rieur et de sant&eacute; militaire et dans les autres &eacute;tablissements de recherche scientifique militaire et relevant du Minist&egrave;re de la D&eacute;fense Nationale. Date limite de d&eacute;p&ocirc;t des demandes : 30 juin 2015\r\n<ul class=\"liste_pucebleu\" style=\"box-sizing: border-box; margin: 0px; list-style: none; padding: 0px 0px 5px 9px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4440\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;28 (PDF</a>)</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><span style=\"box-sizing: border-box; background-color: initial;\">Formulaire Laboratoire de Recherche (2016-2019) (</span><a style=\"box-sizing: border-box; background-color: initial; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4442\" target=\"_blank\" rel=\"noopener\">Word&nbsp;</a><span style=\"box-sizing: border-box; background-color: initial;\">-&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4443\" target=\"_blank\" rel=\"noopener\">PDF</a>)</span></li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\">Formulaire Unit&eacute; de Recherche (2016-2018) (<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4445\" target=\"_blank\" rel=\"noopener\">Word&nbsp;</a>-&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4446\" target=\"_blank\" rel=\"noopener\">PDF</a>)</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4448\" target=\"_blank\" rel=\"noopener\">D&eacute;cret n&deg;2009-644 du 2 mars 2009, fixant l\'organisation et les modalit&eacute;s de fonctionnement des laboratoires de recherche, des unit&eacute;s de recherche et des consortiums de recherche(Pdf).</a></li>\r\n</ul>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><img style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"box-sizing: border-box; background-color: transparent; color: #000000; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-family: Georgia, \'Times New Roman\', Times, serif; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;22 :</a>\r\n<div dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n<div dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">A propos de la modification du nombre de postes &agrave; pourvoir au titre de la session 2015 de recrutement et de promotion des enseignants chercheurs aux grades de ma&icirc;tre-assistant.&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4398\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;22 (PDF)&nbsp;</a><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=3454\" target=\"_blank\" rel=\"noopener\">&nbsp;</a></div>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"box-sizing: border-box; margin: 0px; list-style: none; padding: 0px 0px 5px 9px;\">\r\n<li dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat #ffffff; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4399\" target=\"_blank\" rel=\"noopener\">Modification du nombre de postes &agrave; pourvoir au titre de la session 2015 de recrutement et de promotion des enseignants chercheurs aux grades&nbsp;<span style=\"box-sizing: border-box; color: #ff0000;\">de ma&icirc;tre-assistant</span>.</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><img style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"box-sizing: border-box; background-color: transparent; color: #000000; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-family: Georgia, \'Times New Roman\', Times, serif; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;20 :</a>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n<div dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><span style=\"box-sizing: border-box; background-color: initial;\">A propos du nombre de postes &agrave; pourvoir au titre de la session 2015 de recrutement des enseignants chercheurs.&nbsp;<a style=\"box-sizing: border-box; background-color: initial; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4330\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;20 (PDF)</a></span></div>\r\n</div>\r\n<ul class=\"liste_pucebleu\" style=\"box-sizing: border-box; margin: 0px; list-style: none; padding: 0px 0px 5px 9px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4327\" target=\"_blank\" rel=\"noopener\">Nombre de postes &agrave; pourvoir au titre de la session 2015 de recrutement des enseignants chercheurs.&nbsp;</a></li>\r\n</ul>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><img style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"box-sizing: border-box; background-color: transparent; color: #000000; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-family: Georgia, \'Times New Roman\', Times, serif; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;18 :</a>\r\n<div dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Appel &agrave; candidature pour cr&eacute;ation de laboratoires de recherche et d&rsquo;unit&eacute;s de recherche au sein des &eacute;tablissements d&rsquo;enseignement sup&eacute;rieur et de recherche relevant des universit&eacute;s.&nbsp;<a style=\"box-sizing: border-box; background-color: initial; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4340\" target=\"_blank\" rel=\"noopener\">circulaire n&deg;18 (PDF)</a></div>\r\n<ul class=\"liste_pucebleu\" style=\"box-sizing: border-box; margin: 0px; list-style: none; padding: 0px 0px 5px 9px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><span style=\"box-sizing: border-box; color: #0c1b20; font-size: 12px; background-color: initial;\"><span style=\"box-sizing: border-box; color: #000000; font-size: 11px;\">Formulaire laboratoire de recherche</span>&nbsp;(</span><span style=\"box-sizing: border-box; font-size: 12px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4343\" target=\"_blank\" rel=\"noopener\">word</a></span><a style=\"box-sizing: border-box; background-color: initial; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-size: 12px;\" href=\"http://www.mes.tn/image.php?id=3572\" target=\"_blank\" rel=\"noopener\">&nbsp;</a><span style=\"box-sizing: border-box; color: #0c1b20; font-size: 12px; background-color: initial;\">-&nbsp;</span><span style=\"box-sizing: border-box; font-size: 12px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4344\" target=\"_blank\" rel=\"noopener\">Pdf</a></span><span style=\"box-sizing: border-box; color: #0c1b20; font-size: 12px; background-color: initial;\">)</span></li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><span style=\"box-sizing: border-box; color: #0c1b20; font-size: 12px; background-color: initial;\"><span style=\"box-sizing: border-box; color: #000000; font-size: 11px;\">Formulaire&nbsp;unit&eacute;&nbsp;de recherche</span>&nbsp;(</span><span style=\"box-sizing: border-box; font-size: 12px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4345\" target=\"_blank\" rel=\"noopener\">word&nbsp;</a></span><span style=\"box-sizing: border-box; color: #0c1b20; font-size: 12px; background-color: initial;\">-&nbsp;</span><span style=\"box-sizing: border-box; font-size: 12px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4346\" target=\"_blank\" rel=\"noopener\">Pdf</a></span><span style=\"box-sizing: border-box; color: #0c1b20; font-size: 12px; background-color: initial;\">)</span></li>\r\n</ul>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><img style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"box-sizing: border-box; background-color: transparent; color: #000000; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-family: Georgia, \'Times New Roman\', Times, serif; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;15 :</a>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px; text-align: justify;\">Candidature des laur&eacute;ats des classes terminales de l\'enseignement secondaire &agrave; la poursuite de leurs &eacute;tudes sup&eacute;rieures &agrave; l\'institut pr&eacute;paratoire aux &eacute;tudes scientifiques et techniques de La Marsa (IPEST), aux classes pr&eacute;paratoires fran&ccedil;aises et aux universit&eacute;s allemandes -<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4253\" target=\"_blank\" rel=\"noopener\">&nbsp;Circulaire n&deg; 15 (PDF</a>)</div>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><img style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"box-sizing: border-box; background-color: transparent; color: #000000; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-family: Georgia, \'Times New Roman\', Times, serif; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;14 :&nbsp;</a>Orientation Universitaire pour l\'ann&eacute;e 2015 -&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4254\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;14</a></li>\r\n</ul>', '<ul class=\"liste_circulaire_interne\" style=\"box-sizing: border-box; margin: 20px 0px 21px; list-style: none; padding: 0px; color: #0c1b20; font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: #fbfaf9;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\">\r\n<div dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Appel &agrave; candidature pour cr&eacute;ation de laboratoires et d\'unit&eacute;s de recherche au sein des instituts sup&eacute;rieurs pour le sport et l\'&eacute;ducation physique et d\'autres institutions de Minist&egrave;re de la jeunesse et des sports. Date limite de d&eacute;p&ocirc;t des demandes de laboratoires et d\' unit&eacute;s de recherche aupr&egrave;s des &eacute;tablissements :&nbsp;<span style=\"box-sizing: border-box; color: #ff0000;\">30 juin 2015</span></div>\r\n<div dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"box-sizing: border-box; margin: 0px; list-style: none; padding: 0px 0px 5px 9px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4457\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;31 (PDF)</a></li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><span style=\"box-sizing: border-box; background-color: initial;\">Formulaire Laboratoire de Recherche (2016-2019) (</span><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4460\" target=\"_blank\" rel=\"noopener\">Word</a><a style=\"box-sizing: border-box; background-color: initial; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4442\" target=\"_blank\" rel=\"noopener\">&nbsp;</a><span style=\"box-sizing: border-box; background-color: initial;\">-&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4461\" target=\"_blank\" rel=\"noopener\">PDF</a>)</span></li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\">Formulaire Unit&eacute; de Recherche (2016-2018) (<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4462\" target=\"_blank\" rel=\"noopener\">Word</a><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4445\" target=\"_blank\" rel=\"noopener\">&nbsp;</a>-&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4463\" target=\"_blank\" rel=\"noopener\">PDF</a>)</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4459\" target=\"_blank\" rel=\"noopener\">D&eacute;cret n&deg;2009-644 du 2 mars 2009, fixant l\'organisation et les modalit&eacute;s de fonctionnement des laboratoires de recherche, des unit&eacute;s de recherche et des consortiums de recherche(Pdf).</a></li>\r\n</ul>\r\n</div>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><img style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"box-sizing: border-box; background-color: transparent; color: #000000; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-family: Georgia, \'Times New Roman\', Times, serif; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;28 :&nbsp;</a>Appel &agrave; candidature pour la cr&eacute;ation des laboratoires &nbsp;de recherche&nbsp;et des unit&eacute;s de recherche au sein des institutions d\'enseignement sup&eacute;rieur et de sant&eacute; militaire et dans les autres &eacute;tablissements de recherche scientifique militaire et relevant du Minist&egrave;re de la D&eacute;fense Nationale. Date limite de d&eacute;p&ocirc;t des demandes : 30 juin 2015\r\n<ul class=\"liste_pucebleu\" style=\"box-sizing: border-box; margin: 0px; list-style: none; padding: 0px 0px 5px 9px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4440\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;28 (PDF</a>)</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><span style=\"box-sizing: border-box; background-color: initial;\">Formulaire Laboratoire de Recherche (2016-2019) (</span><a style=\"box-sizing: border-box; background-color: initial; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4442\" target=\"_blank\" rel=\"noopener\">Word&nbsp;</a><span style=\"box-sizing: border-box; background-color: initial;\">-&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4443\" target=\"_blank\" rel=\"noopener\">PDF</a>)</span></li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\">Formulaire Unit&eacute; de Recherche (2016-2018) (<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4445\" target=\"_blank\" rel=\"noopener\">Word&nbsp;</a>-&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4446\" target=\"_blank\" rel=\"noopener\">PDF</a>)</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4448\" target=\"_blank\" rel=\"noopener\">D&eacute;cret n&deg;2009-644 du 2 mars 2009, fixant l\'organisation et les modalit&eacute;s de fonctionnement des laboratoires de recherche, des unit&eacute;s de recherche et des consortiums de recherche(Pdf).</a></li>\r\n</ul>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><img style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"box-sizing: border-box; background-color: transparent; color: #000000; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-family: Georgia, \'Times New Roman\', Times, serif; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;22 :</a>\r\n<div dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n<div dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">A propos de la modification du nombre de postes &agrave; pourvoir au titre de la session 2015 de recrutement et de promotion des enseignants chercheurs aux grades de ma&icirc;tre-assistant.&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4398\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;22 (PDF)&nbsp;</a><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=3454\" target=\"_blank\" rel=\"noopener\">&nbsp;</a></div>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"box-sizing: border-box; margin: 0px; list-style: none; padding: 0px 0px 5px 9px;\">\r\n<li dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat #ffffff; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4399\" target=\"_blank\" rel=\"noopener\">Modification du nombre de postes &agrave; pourvoir au titre de la session 2015 de recrutement et de promotion des enseignants chercheurs aux grades&nbsp;<span style=\"box-sizing: border-box; color: #ff0000;\">de ma&icirc;tre-assistant</span>.</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><img style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"box-sizing: border-box; background-color: transparent; color: #000000; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-family: Georgia, \'Times New Roman\', Times, serif; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;20 :</a>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">\r\n<div dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><span style=\"box-sizing: border-box; background-color: initial;\">A propos du nombre de postes &agrave; pourvoir au titre de la session 2015 de recrutement des enseignants chercheurs.&nbsp;<a style=\"box-sizing: border-box; background-color: initial; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4330\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;20 (PDF)</a></span></div>\r\n</div>\r\n<ul class=\"liste_pucebleu\" style=\"box-sizing: border-box; margin: 0px; list-style: none; padding: 0px 0px 5px 9px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4327\" target=\"_blank\" rel=\"noopener\">Nombre de postes &agrave; pourvoir au titre de la session 2015 de recrutement des enseignants chercheurs.&nbsp;</a></li>\r\n</ul>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><img style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"box-sizing: border-box; background-color: transparent; color: #000000; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-family: Georgia, \'Times New Roman\', Times, serif; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;18 :</a>\r\n<div dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px; padding: 0px;\">Appel &agrave; candidature pour cr&eacute;ation de laboratoires de recherche et d&rsquo;unit&eacute;s de recherche au sein des &eacute;tablissements d&rsquo;enseignement sup&eacute;rieur et de recherche relevant des universit&eacute;s.&nbsp;<a style=\"box-sizing: border-box; background-color: initial; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4340\" target=\"_blank\" rel=\"noopener\">circulaire n&deg;18 (PDF)</a></div>\r\n<ul class=\"liste_pucebleu\" style=\"box-sizing: border-box; margin: 0px; list-style: none; padding: 0px 0px 5px 9px;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><span style=\"box-sizing: border-box; color: #0c1b20; font-size: 12px; background-color: initial;\"><span style=\"box-sizing: border-box; color: #000000; font-size: 11px;\">Formulaire laboratoire de recherche</span>&nbsp;(</span><span style=\"box-sizing: border-box; font-size: 12px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4343\" target=\"_blank\" rel=\"noopener\">word</a></span><a style=\"box-sizing: border-box; background-color: initial; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-size: 12px;\" href=\"http://www.mes.tn/image.php?id=3572\" target=\"_blank\" rel=\"noopener\">&nbsp;</a><span style=\"box-sizing: border-box; color: #0c1b20; font-size: 12px; background-color: initial;\">-&nbsp;</span><span style=\"box-sizing: border-box; font-size: 12px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4344\" target=\"_blank\" rel=\"noopener\">Pdf</a></span><span style=\"box-sizing: border-box; color: #0c1b20; font-size: 12px; background-color: initial;\">)</span></li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><span style=\"box-sizing: border-box; color: #0c1b20; font-size: 12px; background-color: initial;\"><span style=\"box-sizing: border-box; color: #000000; font-size: 11px;\">Formulaire&nbsp;unit&eacute;&nbsp;de recherche</span>&nbsp;(</span><span style=\"box-sizing: border-box; font-size: 12px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4345\" target=\"_blank\" rel=\"noopener\">word&nbsp;</a></span><span style=\"box-sizing: border-box; color: #0c1b20; font-size: 12px; background-color: initial;\">-&nbsp;</span><span style=\"box-sizing: border-box; font-size: 12px;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4346\" target=\"_blank\" rel=\"noopener\">Pdf</a></span><span style=\"box-sizing: border-box; color: #0c1b20; font-size: 12px; background-color: initial;\">)</span></li>\r\n</ul>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><img style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"box-sizing: border-box; background-color: transparent; color: #000000; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-family: Georgia, \'Times New Roman\', Times, serif; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;15 :</a>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px; text-align: justify;\">Candidature des laur&eacute;ats des classes terminales de l\'enseignement secondaire &agrave; la poursuite de leurs &eacute;tudes sup&eacute;rieures &agrave; l\'institut pr&eacute;paratoire aux &eacute;tudes scientifiques et techniques de La Marsa (IPEST), aux classes pr&eacute;paratoires fran&ccedil;aises et aux universit&eacute;s allemandes -<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4253\" target=\"_blank\" rel=\"noopener\">&nbsp;Circulaire n&deg; 15 (PDF</a>)</div>\r\n<div style=\"box-sizing: border-box; margin: 0px; padding: 0px;\"><img style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"box-sizing: border-box; background-color: transparent; color: #000000; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none; font-family: Georgia, \'Times New Roman\', Times, serif; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;14 :&nbsp;</a>Orientation Universitaire pour l\'ann&eacute;e 2015 -&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #555555; text-decoration-line: none; -webkit-font-smoothing: antialiased; outline: none;\" href=\"http://www.mes.tn/image.php?id=4254\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;14</a></li>\r\n</ul>', NULL, NULL, NULL, 'PUBLISHED', 'theme-jurique-2', 0, '1', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2019-07-23 04:29:42', '2019-07-23 04:29:42'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2019-07-23 04:29:42', '2019-07-23 04:29:42'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2019-07-23 04:29:42', '2019-07-23 04:29:42'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2019-07-23 04:29:42', '2019-07-23 04:29:42'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2019-07-23 04:29:42', '2019-07-23 04:29:42'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2019-07-23 04:29:42', '2019-07-23 04:29:42'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2019-07-23 04:29:42', '2019-07-23 04:29:42'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2019-07-23 04:29:42', '2019-07-23 04:29:42'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2019-07-23 04:29:43', '2019-07-23 04:29:43'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2019-07-23 04:29:44', '2019-07-23 04:29:44'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2019-07-23 04:29:44', '2019-07-23 04:29:44'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2019-07-23 04:29:44', '2019-07-23 04:29:44'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2019-07-23 04:29:44', '2019-07-23 04:29:44'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2019-07-23 04:29:44', '2019-07-23 04:29:44'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2019-07-23 04:29:44', '2019-07-23 04:29:44'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2019-07-23 04:29:44', '2019-07-23 04:29:44'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2019-07-23 04:29:44', '2019-07-23 04:29:44'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2019-07-23 04:29:44', '2019-07-23 04:29:44');

-- --------------------------------------------------------

--
-- Structure de la table `types`
--

CREATE TABLE `types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_fr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_ar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `texte_juridique_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `texte_juridique_ar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `texte_juridique_en` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ATTENTE',
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `type_loi_fr` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_loi_ar` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_loi_en` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `Annee` int(11) DEFAULT NULL,
  `creerPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifierPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverPar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approuverLe` datetime DEFAULT NULL,
  `depublierLe` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `types`
--

INSERT INTO `types` (`id`, `type_fr`, `type_ar`, `type_en`, `texte_juridique_fr`, `texte_juridique_ar`, `texte_juridique_en`, `deleted_at`, `created_at`, `updated_at`, `seo_title`, `meta_description`, `meta_keywords`, `status`, `slug`, `featured`, `type_loi_fr`, `type_loi_ar`, `type_loi_en`, `Annee`, `creerPar`, `modifierPar`, `approuverPar`, `approuverLe`, `depublierLe`) VALUES
(2, 'Circulaires 2016', NULL, NULL, '<ul class=\"liste_circulaire_interne\" style=\"margin: 20px 0px 21px; padding: 0px; list-style: none; color: #0c1b20; font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: #fbfaf9;\">\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;42 :</a>\r\n<div dir=\"ltr\" style=\"margin: 0px; padding: 0px;\">A propos de la modification du nombre de postes &agrave; pourvoir au titre de la session 2016 de recrutement des enseignants chercheurs au grade&nbsp;<span style=\"color: #ff0000;\">d\'Assistant</span>.</div>\r\n<div style=\"margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li dir=\"ltr\" style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat #ffffff; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=5962\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;42 (PDF) &nbsp;</a></li>\r\n<li dir=\"ltr\" style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat #ffffff; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=5970\" target=\"_blank\" rel=\"noopener\">Modification du nombre de postes &agrave; pourvoir au titre de la session 2016 de recrutement des enseignants chercheurs au grade&nbsp;<span style=\"color: #ff0000;\">d\'Assistant</span>.</a></li>\r\n<li dir=\"ltr\" style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat #ffffff; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none; background-color: initial;\" href=\"http://www.mes.tn/image.php?id=5963\" target=\"_blank\" rel=\"noopener\">Mise &agrave; jour du&nbsp; nombre de postes &agrave; pourvoir au titre de la session 2016 des recrutement des&nbsp;<span style=\"color: #ff0000;\">Assistants&nbsp;</span>r&eacute;partis<span style=\"color: #ff0000;\">&nbsp;par Disciplines</span>.</a></li>\r\n<li dir=\"ltr\" style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=5964\" target=\"_blank\" rel=\"noopener\">Mise &agrave; jour du&nbsp; nombre de postes &agrave; pourvoir au titre de la session 2016 de recrutemendes&nbsp;<span style=\"color: #ff0000;\">Assistants&nbsp;</span>r&eacute;partis&nbsp;<span style=\"color: #ff0000;\">par Universit&eacute;s</span>.</a></li>\r\n</ul>\r\n</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;41 :</a>\r\n<div dir=\"ltr\" style=\"margin: 0px; padding: 0px;\">A propos de la modification du nombre de postes &agrave; pourvoir au titre de la session 2016 de recrutement et de promotion des enseignants chercheurs&nbsp;<span style=\"color: #ff0000;\">(Ma&icirc;tres Assistants)</span>.</div>\r\n<div style=\"margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li dir=\"ltr\" style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=5959\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;41 (PDF)&nbsp;</a></li>\r\n<li dir=\"ltr\" style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=5958\" target=\"_blank\" rel=\"noopener\">Modification du nombre de postes &agrave; pourvoir au titre de la session 2016 de recrutement et de promotion des enseignants chercheurs&nbsp;<span style=\"color: #ff0000;\">(Ma&icirc;tres Assistants).</span></a></li>\r\n<li dir=\"ltr\" style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=5956\" target=\"_blank\" rel=\"noopener\">Mise &agrave; jour du&nbsp; nombre de postes &agrave; pourvoir au titre de la session 2016 de recrutement et de promotion des enseignants chercheurs r&eacute;partis<span style=\"color: #ff0000;\">&nbsp;par Disciplines</span>&nbsp;apr&egrave;s modification des postes ouverts au grade de&nbsp;<span style=\"color: #ff0000;\">Ma&icirc;tre Assistant</span>.</a></li>\r\n<li dir=\"ltr\" style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=5957\">Mise &agrave; jour du&nbsp; nombre de postes &agrave; pourvoir au titre de la session 2016 de recrutement et de promotion des enseignants chercheurs r&eacute;partis&nbsp;<span style=\"color: #ff0000;\">par Universit&eacute;s</span>&nbsp;apr&egrave;s modification des postes ouverts au grade de&nbsp;<span style=\"color: #ff0000;\">Ma&icirc;tre Assistant</span>.</a></li>\r\n</ul>\r\n</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;39 :</a>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">A propos du nombre de postes &agrave; pourvoir au titre de la session 2014 de recrutement des enseignants chercheurs.&nbsp;</div>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">- Nombre de postes &agrave; pourvoir au titre de la session 2014 de recrutement des enseignants chercheurs.&nbsp;</div>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">Pour d&eacute;poser la demande de candidature pour le concours sur dipl&ocirc;mes &nbsp;au grade de professeur principal hors classe et professeur principal du corps interd&eacute;partemental des enseignants de langue anglaise et d\'informatique, acc&eacute;der au site suivant &nbsp;www.cppes.mes.rnu.tn</div>\r\n<div dir=\"ltr\" style=\"margin: 0px; padding: 0px;\">A propos du nombre de postes &agrave; pourvoir au titre de la session 2016 de recrutement des enseignants chercheurs -&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=5896\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;39 (PDF)</a></div>\r\n<div style=\"margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li dir=\"ltr\" style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=5897\" target=\"_blank\" rel=\"noopener\"><span style=\"font-size: 12px;\">Nombre de postes &agrave; pourvoir au titre de la session 2016 de recrutement des enseignants chercheurs</span><span style=\"color: #0c1b20; font-size: 12px;\">.</span></a></li>\r\n</ul>\r\n</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;14 :</a>\r\n<div dir=\"ltr\" style=\"margin: 0px; padding: 0px;\">Appel &agrave; candidatures pour cr&eacute;ation de laboratoires de recherche au sein de l\'h&ocirc;pital des forces de s&eacute;curite int&eacute;rieure de la Marsa - date limite de d&eacute;p&ocirc;t des demandes de laboratoires de recherche aupr&egrave;s de l\'&eacute;tablissement&nbsp;<span style=\"color: #ff0000;\">14 mars 2016</span>.&nbsp;</div>\r\n<div dir=\"ltr\" style=\"margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=5356\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;14 (PDF)</a></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><span style=\"background-color: initial;\">Formulaire Laboratoire de Recherche (2016-2019) (</span><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=5358\" target=\"_blank\" rel=\"noopener\">Word&nbsp;</a><span style=\"background-color: initial;\">-&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=5359\" target=\"_blank\" rel=\"noopener\">PDF</a>)</span></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"outline: none; text-decoration-line: none; background-color: initial;\" href=\"http://www.mes.tn/image.php?id=4942\" target=\"_blank\" rel=\"noopener\">D&eacute;cret n&deg;2009-644 du 2 mars 2009, fixant l\'organisation et les modalit&eacute;s de fonctionnement des laboratoires de recherche, des unit&eacute;s de recherche et des consortiums de recherche(Pdf).</a></li>\r\n</ul>\r\n</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n</ul>', NULL, NULL, NULL, '2019-09-17 10:05:31', '2020-01-10 06:16:36', NULL, NULL, NULL, 'PUBLISHED', 'circulaires-2016', 0, 'Circulaire', 'منشور', 'Circular', 2016, '1', NULL, NULL, NULL, NULL),
(3, 'Liste des circulaires de l\'année 2015', NULL, NULL, '<ul class=\"liste_circulaire_interne\" style=\"margin: 20px 0px 21px; padding: 0px; list-style: none; color: #0c1b20; font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: #fbfaf9;\">\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;31 :</a>\r\n<div dir=\"ltr\" style=\"margin: 0px; padding: 0px;\">Appel &agrave; candidature pour cr&eacute;ation de laboratoires et d\'unit&eacute;s de recherche au sein des instituts sup&eacute;rieurs pour le sport et l\'&eacute;ducation physique et d\'autres institutions de Minist&egrave;re de la jeunesse et des sports. Date limite de d&eacute;p&ocirc;t des demandes de laboratoires et d\' unit&eacute;s de recherche aupr&egrave;s des &eacute;tablissements :&nbsp;<span style=\"color: #ff0000;\">30 juin 2015</span></div>\r\n<div dir=\"ltr\" style=\"margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4457\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;31 (PDF)</a></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><span style=\"background-color: initial;\">Formulaire Laboratoire de Recherche (2016-2019) (</span><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4460\" target=\"_blank\" rel=\"noopener\">Word</a><a style=\"outline: none; text-decoration-line: none; background-color: initial;\" href=\"http://www.mes.tn/image.php?id=4442\" target=\"_blank\" rel=\"noopener\">&nbsp;</a><span style=\"background-color: initial;\">-&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4461\" target=\"_blank\" rel=\"noopener\">PDF</a>)</span></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\">Formulaire Unit&eacute; de Recherche (2016-2018) (<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4462\" target=\"_blank\" rel=\"noopener\">Word</a><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4445\" target=\"_blank\" rel=\"noopener\">&nbsp;</a>-&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4463\" target=\"_blank\" rel=\"noopener\">PDF</a>)</li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4459\" target=\"_blank\" rel=\"noopener\">D&eacute;cret n&deg;2009-644 du 2 mars 2009, fixant l\'organisation et les modalit&eacute;s de fonctionnement des laboratoires de recherche, des unit&eacute;s de recherche et des consortiums de recherche(Pdf).</a></li>\r\n</ul>\r\n</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;28 :&nbsp;</a>Appel &agrave; candidature pour la cr&eacute;ation des laboratoires &nbsp;de recherche&nbsp;et des unit&eacute;s de recherche au sein des institutions d\'enseignement sup&eacute;rieur et de sant&eacute; militaire et dans les autres &eacute;tablissements de recherche scientifique militaire et relevant du Minist&egrave;re de la D&eacute;fense Nationale. Date limite de d&eacute;p&ocirc;t des demandes : 30 juin 2015\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4440\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;28 (PDF</a>)</li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><span style=\"background-color: initial;\">Formulaire Laboratoire de Recherche (2016-2019) (</span><a style=\"outline: none; text-decoration-line: none; background-color: initial;\" href=\"http://www.mes.tn/image.php?id=4442\" target=\"_blank\" rel=\"noopener\">Word&nbsp;</a><span style=\"background-color: initial;\">-&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4443\" target=\"_blank\" rel=\"noopener\">PDF</a>)</span></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\">Formulaire Unit&eacute; de Recherche (2016-2018) (<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4445\" target=\"_blank\" rel=\"noopener\">Word&nbsp;</a>-&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4446\" target=\"_blank\" rel=\"noopener\">PDF</a>)</li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4448\" target=\"_blank\" rel=\"noopener\">D&eacute;cret n&deg;2009-644 du 2 mars 2009, fixant l\'organisation et les modalit&eacute;s de fonctionnement des laboratoires de recherche, des unit&eacute;s de recherche et des consortiums de recherche(Pdf).</a></li>\r\n</ul>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;22 :</a>\r\n<div dir=\"ltr\" style=\"margin: 0px; padding: 0px;\">\r\n<div dir=\"ltr\" style=\"margin: 0px; padding: 0px;\">A propos de la modification du nombre de postes &agrave; pourvoir au titre de la session 2015 de recrutement et de promotion des enseignants chercheurs aux grades de ma&icirc;tre-assistant.&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4398\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;22 (PDF)&nbsp;</a><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3454\" target=\"_blank\" rel=\"noopener\">&nbsp;</a></div>\r\n<div style=\"margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li dir=\"ltr\" style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat #ffffff; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4399\" target=\"_blank\" rel=\"noopener\">Modification du nombre de postes &agrave; pourvoir au titre de la session 2015 de recrutement et de promotion des enseignants chercheurs aux grades&nbsp;<span style=\"color: #ff0000;\">de ma&icirc;tre-assistant</span>.</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;20 :</a>\r\n<div style=\"margin: 0px; padding: 0px;\">\r\n<div dir=\"ltr\" style=\"margin: 0px; padding: 0px;\"><span style=\"background-color: initial;\">A propos du nombre de postes &agrave; pourvoir au titre de la session 2015 de recrutement des enseignants chercheurs.&nbsp;<a style=\"outline: none; text-decoration-line: none; background-color: initial;\" href=\"http://www.mes.tn/image.php?id=4330\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;20 (PDF)</a></span></div>\r\n</div>\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4327\" target=\"_blank\" rel=\"noopener\">Nombre de postes &agrave; pourvoir au titre de la session 2015 de recrutement des enseignants chercheurs.&nbsp;</a></li>\r\n</ul>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;18 :</a>\r\n<div dir=\"ltr\" style=\"margin: 0px; padding: 0px;\">Appel &agrave; candidature pour cr&eacute;ation de laboratoires de recherche et d&rsquo;unit&eacute;s de recherche au sein des &eacute;tablissements d&rsquo;enseignement sup&eacute;rieur et de recherche relevant des universit&eacute;s.&nbsp;<a style=\"outline: none; text-decoration-line: none; background-color: initial;\" href=\"http://www.mes.tn/image.php?id=4340\" target=\"_blank\" rel=\"noopener\">circulaire n&deg;18 (PDF)</a></div>\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><span style=\"color: #0c1b20; font-size: 12px; background-color: initial;\"><span style=\"color: #000000; font-size: 11px;\">Formulaire laboratoire de recherche</span>&nbsp;(</span><span style=\"font-size: 12px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4343\" target=\"_blank\" rel=\"noopener\">word</a></span><a style=\"outline: none; text-decoration-line: none; font-size: 12px; background-color: initial;\" href=\"http://www.mes.tn/image.php?id=3572\" target=\"_blank\" rel=\"noopener\">&nbsp;</a><span style=\"color: #0c1b20; font-size: 12px; background-color: initial;\">-&nbsp;</span><span style=\"font-size: 12px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4344\" target=\"_blank\" rel=\"noopener\">Pdf</a></span><span style=\"color: #0c1b20; font-size: 12px; background-color: initial;\">)</span></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px; text-align: left;\"><span style=\"color: #0c1b20; font-size: 12px; background-color: initial;\"><span style=\"color: #000000; font-size: 11px;\">Formulaire&nbsp;unit&eacute;&nbsp;de recherche</span>&nbsp;(</span><span style=\"font-size: 12px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4345\" target=\"_blank\" rel=\"noopener\">word&nbsp;</a></span><span style=\"color: #0c1b20; font-size: 12px; background-color: initial;\">-&nbsp;</span><span style=\"font-size: 12px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4346\" target=\"_blank\" rel=\"noopener\">Pdf</a></span><span style=\"color: #0c1b20; font-size: 12px; background-color: initial;\">)</span></li>\r\n</ul>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;15 :</a>\r\n<div style=\"margin: 0px; padding: 0px; text-align: justify;\">Candidature des laur&eacute;ats des classes terminales de l\'enseignement secondaire &agrave; la poursuite de leurs &eacute;tudes sup&eacute;rieures &agrave; l\'institut pr&eacute;paratoire aux &eacute;tudes scientifiques et techniques de La Marsa (IPEST), aux classes pr&eacute;paratoires fran&ccedil;aises et aux universit&eacute;s allemandes -<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4253\" target=\"_blank\" rel=\"noopener\">&nbsp;Circulaire n&deg; 15 (PDF</a>)</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;14 :&nbsp;</a>Orientation Universitaire pour l\'ann&eacute;e 2015 -&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=4254\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;14</a>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n</ul>', NULL, NULL, NULL, '2020-01-09 05:25:36', '2020-01-10 06:16:28', NULL, NULL, NULL, 'PUBLISHED', 'liste-des-circulaires-de-l-annee-2015', 0, 'Circulaire', 'منشور', 'Circular', 2015, '1', NULL, NULL, NULL, NULL);
INSERT INTO `types` (`id`, `type_fr`, `type_ar`, `type_en`, `texte_juridique_fr`, `texte_juridique_ar`, `texte_juridique_en`, `deleted_at`, `created_at`, `updated_at`, `seo_title`, `meta_description`, `meta_keywords`, `status`, `slug`, `featured`, `type_loi_fr`, `type_loi_ar`, `type_loi_en`, `Annee`, `creerPar`, `modifierPar`, `approuverPar`, `approuverLe`, `depublierLe`) VALUES
(4, 'Liste des circulaires de l\'année 2014', NULL, NULL, '<ul class=\"liste_circulaire_interne\" style=\"margin: 20px 0px 21px; padding: 0px; list-style: none; color: #0c1b20; font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: #fbfaf9;\">\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;47 :&nbsp;</a>A propos de l\'ouverture de trois concours internes sur dossiers pour la promotion aux grades de technicien principal hors classe de laboratoire, technicien principal de laboratoire et technicien de laboratoire -&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3796\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;47 (PDF)</a>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;46 :&nbsp;</a>A propos de l\'ouverture de deux concours internes sur dossiers pour la promotion aux grades d\'architecte g&eacute;n&eacute;ral et d\'architecte en chef -&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3795\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;46 (PDF</a>)\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;45 :&nbsp;</a>&Eacute;lections des repr&eacute;sentants des &eacute;tudiants aux conseils scientifiques.\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3794\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;45</a>&nbsp;(PDF)</li>\r\n</ul>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;38 :&nbsp;</a>Calendrier de l\'Ann&eacute;e Universitaire 2014-2015 -<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3521\" target=\"_blank\" rel=\"noopener\">&nbsp;Circulaire n&deg; 38</a>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;33 :</a>\r\n<div dir=\"ltr\" style=\"margin: 0px; padding: 0px;\">A propos de la modification du nombre de postes &agrave; pourvoir au titre de la session 2014 de recrutement des enseignants chercheurs aux grades de ma&icirc;tre de conf&eacute;rence et de professeur.&nbsp;<span class=\"link_savoir_plus\" style=\"font-style: italic; text-decoration-line: underline; display: inline-block; margin: -1px 0px 0px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3454\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;<span style=\"color: #0c1b20; font-size: 12px; font-style: normal;\">&nbsp;</span>33 &nbsp;format PDF</a></span></div>\r\n<div style=\"margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li dir=\"ltr\" style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat #ffffff; border-bottom: none; line-height: 16px; text-align: left;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3453\" target=\"_blank\" rel=\"noopener\">Modification du nombre de postes &agrave; pourvoir au titre de la session 2014 de recrutement des enseignants chercheurs aux grades&nbsp;<span style=\"color: #ff0000;\">de ma&icirc;tre de conf&eacute;rence et de professeur</span>.</a></li>\r\n</ul>\r\n</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">ِCirculaire n&deg;28 :</a>\r\n<div style=\"margin: 0px; padding: 0px;\">A propos de la modification du nombre de postes &agrave; pourvoir au titre de la session 2014 de recrutement des enseignants chercheurs au grade d\'Assistant.</div>\r\n<div style=\"margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat #ffffff; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3306\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;28 (PDF)&nbsp;</a>&nbsp;</li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat #ffffff; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3307\" target=\"_blank\" rel=\"noopener\">Modification du nombre de postes &agrave; pourvoir au titre de la session 2014 de recrutement des enseignants chercheurs au grade d\'Assistant.</a></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat #ffffff; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3309\" target=\"_blank\" rel=\"noopener\">Mise &agrave; jour du nombre de postes &agrave; pourvoir au titre de la session de recrutement des enseignants chercheurs de l\'ann&eacute;e 2014 r&eacute;partis<span style=\"color: #ff0000;\">&nbsp;par Disciplines</span>&nbsp;apr&egrave;s modification des postes ouverts au grade d\'Assistant.</a></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat #ffffff; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3308\" target=\"_blank\" rel=\"noopener\">Mise &agrave; jour du nombre de postes &agrave; pourvoir au titre de la session de recrutement des enseignants chercheurs de l\'ann&eacute;e 2014 r&eacute;partis&nbsp;<span style=\"color: #ff0000;\">par Universit&eacute;s</span>&nbsp;apr&egrave;s modification des postes ouverts au grade d\'Assistant.</a></li>\r\n</ul>\r\n</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;26 :&nbsp;</a>Concours d\'agr&eacute;gation en langue et litt&eacute;rature arabes, en langue et litt&eacute;rature fran&ccedil;aises, en langue et litt&eacute;rature anglaises, en philosophie, en histoire et en g&eacute;ographie au titre de l\'ann&eacute;e 2014.&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3262\" target=\"_blank\" rel=\"noopener\">Circulaire 26 sous format PDF</a>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire 24 :&nbsp;</a>A propos de la modification du nombre de postes &agrave; pourvoir au titre de la session 2014 de recrutement des enseignants chercheurs&nbsp;<span style=\"color: #ff0000;\">(Ma&icirc;tres Assistants)</span>.<br />\r\n<div style=\"margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3206\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;24 (PDF)</a>&nbsp;</li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3205\" target=\"_blank\" rel=\"noopener\">Modification du nombre de postes &agrave; pourvoir au titre de la session 2014 de recrutement des enseignants chercheurs&nbsp;<span style=\"color: #ff0000;\">(Ma&icirc;tres Assistants).</span></a></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3218\" target=\"_blank\" rel=\"noopener\">Mise &agrave; jour du&nbsp; nombre de postes &agrave; pourvoir au titre de la session de recrutement des enseignants chercheurs de l\'ann&eacute;e 2014 r&eacute;partis<span style=\"color: #ff0000;\">&nbsp;par Disciplines</span>&nbsp;apr&egrave;s modification des postes ouverts au grade de Ma&icirc;tre Assistant.</a></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3219\" target=\"_blank\" rel=\"noopener\">Mise &agrave; jour du&nbsp; nombre de postes &agrave; pourvoir au titre de la session de recrutement des enseignants chercheurs de l\'ann&eacute;e 2014 r&eacute;partis&nbsp;<span style=\"color: #ff0000;\">par Universit&eacute;s</span>&nbsp;apr&egrave;s modification des postes ouverts au grade de Ma&icirc;tre Assistant.</a></li>\r\n</ul>\r\n</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire 23 :&nbsp;</a>R&eacute;sultats des &eacute;lections des membres des commissions nationales consultatives et des jurys de recrutement ou de promotion au titre des ann&eacute;es 2014 et 2015.&nbsp;&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3164\" target=\"_blank\" rel=\"noopener\">Circulaire 23 sous format PDF</a><br />\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3166\" target=\"_blank\" rel=\"noopener\">Liste nominative des membres &eacute;lus relative &agrave; la composition des commissions nationales consultatives pour la promotion au grade de professeur de l\'enseignement sup&eacute;rieur.</a></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3168\" target=\"_blank\" rel=\"noopener\">Liste nominative des membres &eacute;lus relative &agrave; la composition des jurys de recrutement des maitres de conf&eacute;rences de l\'enseignement sup&eacute;rieur.</a></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3167\" target=\"_blank\" rel=\"noopener\">Liste nominative des membres &eacute;lus relative &agrave; la composition des jurys de recrutement et de promotion au grade de maitre assistant de l\'enseignement sup&eacute;rieur.</a></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3165\" target=\"_blank\" rel=\"noopener\">Liste nominative des membres &eacute;lus relative &agrave; la composition des jurys de recrutement des assistants de l\'enseignement sup&eacute;rieur.</a></li>\r\n</ul>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg; 22 :</a>\r\n<div style=\"margin: 0px; padding: 0px; text-align: justify;\">Candidature des laur&eacute;ats des classes terminales de l\'enseignement secondaire &agrave; la poursuite de leurs &eacute;tudes sup&eacute;rieures &agrave; l\'institut pr&eacute;paratoire aux &eacute;tudes scientifiques et techniques de La Marsa (IPEST), aux classes pr&eacute;paratoires fran&ccedil;aises et aux universit&eacute;s allemandes -&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3172\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg; 22 (PDF)</a>&nbsp;</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg; 21 :&nbsp;</a>Orientation Universitaire pour l\'ann&eacute;e 2014 -&nbsp;<a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3171\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg; 21 (PDF)</a>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire 17 :&nbsp;</a>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">Circulaire 17 : A propos de l\'ouverture d\'un concours interne sur dipl&ocirc;mes pour la promotion au grade de professeur principal du corps interd&eacute;partemental des enseignants de langue anglaise et d\'informatique - Session 2013.&nbsp;</div>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">Pour d&eacute;poser la demande de candidature pour le concours sur dipl&ocirc;mes &nbsp;au grade de professeur principal hors classe et professeur principal du corps interd&eacute;partemental des enseignants de langue anglaise et d\'informatique, acc&eacute;der au site suivant &nbsp;www.cppes.mes.rnu.tn</div>\r\nA propos de l\'ouverture d\'un concours interne sur dipl&ocirc;mes pour la promotion au grade de professeur principal du corps interd&eacute;partemental des enseignants de langue anglaise et d\'informatique - Session 2013.&nbsp;<span style=\"line-height: 16px; font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3001\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;17 sous format PDF</a></span>\r\n<div style=\"margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><span style=\"color: #0c1b20; font-size: 12px;\">Pour d&eacute;poser la demande de candidature pour le concours sur dipl&ocirc;mes &nbsp;au grade de professeur principal hors classe et professeur principal du corps interd&eacute;partemental des enseignants de langue anglaise et d\'informatique, acc&eacute;der au site suivant &nbsp;</span><a style=\"outline: none; text-decoration-line: none; font-size: 12px;\" href=\"http://www.cppes.mes.rnu.tn/\" target=\"_blank\" rel=\"noopener\">www.cppes.mes.rnu.tn</a></li>\r\n</ul>\r\n</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;16 :&nbsp;</a>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">A propos du nombre de postes &agrave; pourvoir au titre de la session 2014 de recrutement des enseignants chercheurs.&nbsp;</div>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">- Nombre de postes &agrave; pourvoir au titre de la session 2014 de recrutement des enseignants chercheurs.&nbsp;</div>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">Pour d&eacute;poser la demande de candidature pour le concours sur dipl&ocirc;mes &nbsp;au grade de professeur principal hors classe et professeur principal du corps interd&eacute;partemental des enseignants de langue anglaise et d\'informatique, acc&eacute;der au site suivant &nbsp;www.cppes.mes.rnu.tn</div>\r\nA propos du nombre de postes &agrave; pourvoir au titre de la session 2014 de recrutement des enseignants chercheurs. &nbsp;<span style=\"line-height: 16px; font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3003\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;16 sous format PDF</a></span>\r\n<div style=\"margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><a style=\"outline: none; text-decoration-line: none; font-size: 12px;\" href=\"http://www.mes.tn/image.php?id=3004\" target=\"_blank\" rel=\"noopener\">Nombre de postes &agrave; pourvoir au titre de la session 2014 de recrutement des enseignants chercheurs</a><span style=\"color: #0c1b20; font-size: 12px;\">.</span></li>\r\n</ul>\r\n</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire 15 :</a>\r\n<div style=\"margin: 0px; padding: 0px;\">A propos de l\'ouverture d\'un concours interne sur dipl&ocirc;mes pour la promotion au grade de professeur principal hors classe du corps interd&eacute;partemental des enseignants de langue anglaise et d\'informatique - Session 2013.&nbsp;<span style=\"line-height: 16px; font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3000\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;15 sous format PDF</a></span></div>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">Pour d&eacute;poser la demande de candidature pour le concours sur dipl&ocirc;mes &nbsp;au grade de professeur principal hors classe et professeur principal du corps interd&eacute;partemental des enseignants de langue anglaise et d\'informatique, acc&eacute;der au site suivant &nbsp;www.cppes.mes.rnu.tn</div>\r\n<div style=\"margin: 0px; padding: 0px;\">\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><span style=\"color: #0c1b20; font-size: 12px;\">Pour d&eacute;poser la demande de candidature pour le concours sur dipl&ocirc;mes &nbsp;au grade de professeur principal hors classe et professeur principal du corps interd&eacute;partemental des enseignants de langue anglaise et d\'informatique, acc&eacute;der au site suivant &nbsp;</span><a style=\"outline: none; text-decoration-line: none; font-size: 12px;\" href=\"http://www.cppes.mes.rnu.tn/\" target=\"_blank\" rel=\"noopener\">www.cppes.mes.rnu.tn</a></li>\r\n</ul>\r\n</div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;14 :</a>\r\n<div style=\"margin: 0px; padding: 0px;\">Organisation d\'une session de recrutement et de promotion d\'enseignants-chercheurs au titre de l\'ann&eacute;e 2014.&nbsp;<span style=\"line-height: 16px; font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=2999\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;14 sous format PDF</a></span></div>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;13 :&nbsp;</a>&Eacute;lections des repr&eacute;sentants des &eacute;tudiants aux conseils scientifiques.&nbsp;<span style=\"line-height: 16px; font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3064\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;13 sous format PDF</a></span>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;10 :&nbsp;</a>A propos de l\'ouverture d\'un concours interne sur dossiers pour la promotion au grade d\'analyste (Secteur de l\'Enseignement Sup&eacute;rieur et de la Recherche Scientifique).&nbsp;<span style=\"line-height: 16px; font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3063\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;10 sous format PDF</a></span>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;9 :</a>\r\n<p style=\"margin: 0px; padding: 0px; line-height: 16px;\">A propos de l\'ouverture d\'un concours interne sur dossiers pour la promotion au grade de technicien sup&eacute;rieur en chef de la sant&eacute; publique (Secteur de l\'Enseignement Sup&eacute;rieur et de la Recherche Scientifique).&nbsp;<span style=\"line-height: 16px; font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3062\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;9 sous format PDF</a></span></p>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;8 :&nbsp;</a>Prolongation des d&eacute;lais pour le d&eacute;p&ocirc;t des candidatures concernant les trois concours internes sur dossiers pour la promotion aux grades de technicien principal hors classe de laboratoire, de technicien principal de laboratoire et de technicien de laboratoire (Secteur de l\'Enseignement Sup&eacute;rieur et de la Recherche Scientifique).&nbsp;<span style=\"line-height: 16px; font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3061\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;8 sous format PDF</a></span>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;7 :&nbsp;</a>Prolongation des d&eacute;lais pour le d&eacute;p&ocirc;t des candidatures concernant le concours interne sur dossiers pour la promotion au grade de conservateur en chef des biblioth&egrave;ques ou de documentation (Secteur de l\'Enseignement Sup&eacute;rieur et de la Recherche Scientifique).&nbsp;<span style=\"line-height: 16px; font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3060\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;7 sous format PDF</a></span>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;6 :</a>\r\n<p style=\"margin: 0px; padding: 0px; line-height: 16px;\">Prolongation des d&eacute;lais pour le d&eacute;p&ocirc;t des candidatures concernant de deux concours internes sur dossiers pour la promotion aux grades d\'ing&eacute;nieur g&eacute;n&eacute;ral et d\'ing&eacute;nieur en chef (Secteur de l\'Enseignement Sup&eacute;rieur et de la Recherche Scientifique).&nbsp;<span style=\"line-height: 16px; font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3059\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;6 sous format PDF</a></span></p>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;5 :</a>\r\n<p style=\"margin: 0px; padding: 0px; line-height: 16px;\">Prolongation des d&eacute;lais pour le d&eacute;p&ocirc;t des candidatures concernant le concours interne sur dossiers pour la promotion au grade d\'analyste en chef (Secteur de l\'Enseignement Sup&eacute;rieur et de la Recherche Scientifique).&nbsp;<span style=\"font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3058\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;5 sous format PDF</a></span></p>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;4 :&nbsp;</a>A propos de l\'ouverture d\'un examen professionnel pour l\'int&eacute;gration des ouvriers appartenant aux cat&eacute;gories 4, 5, 6 et 7 au grade d\'agent technique (Secteur de l\'Enseignement Sup&eacute;rieur et de la Recherche Scientifique).<span style=\"font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3057\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;4 sous format PDF</a></span>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;3 :&nbsp;</a>Nouvelles &Eacute;lections des membres des commissions nationales consultatives et des commissions nationales de recrutement ou de promotion au titre des ann&eacute;es 2014 et 2015 qui n\'ont pas &eacute;t&eacute; pourvues conform&eacute;ment aux dispositions r&eacute;glementaires au concours du premier tour .&nbsp;<span style=\"font-style: italic; text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3014\">Circulaire n&deg;3 sous format PDF</a></span>\r\n<div style=\"margin: 0px; padding: 0px;\"><img style=\"border: 0px; margin: 0px; padding: 0px;\" src=\"http://www.mes.tn/fr/image/gif/px.gif\" alt=\"\" /></div>\r\n</li>\r\n<li style=\"margin: 0px; padding: 11px 0px; border-bottom: 1px solid #e5e5e5; line-height: 16px; font-size: 11px; color: #000000;\"><a class=\"txt_noire_11_gras font_georgia\" style=\"outline: none; text-decoration-line: none; font-family: Georgia, \'Times New Roman\', Times, serif; color: #000000; font-weight: bold;\" href=\"http://www.mes.tn/cilculaire.php?code_menu=58\">Circulaire n&deg;1 : :&nbsp;</a>\r\n<div id=\"_mcePaste\" class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">Circulaire n&deg;1 : &Eacute;lections des membres des commissions nationales consultatives et des commissions nationales de recrutement ou de promotion au titre des ann&eacute;es 2014 et 2015.&nbsp;</div>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">Liste des candidats pour les commissions nationales &nbsp;consultatives pour la promotion au grade de professeur de l\'enseignement sup&eacute;rieur</div>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">Liste des candidats pour les commissions nationales de recrutement au grade de ma&icirc;tre de conf&eacute;rence de l\'enseignement sup&eacute;rieur</div>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">Liste des candidats pour les commissions nationales de recrutement ou de promotion au grade de ma&icirc;tre assistant de l\'enseignement sup&eacute;rieur</div>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">Liste des candidats pour les commissions nationales de recrutement au grade d\'assistant de l\'enseignement sup&eacute;rieur</div>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">Formulaire</div>\r\n<div id=\"_mcePaste\" style=\"margin: 0px; padding: 0px; position: absolute; left: -10000px; top: 0px; width: 1px; height: 1px; overflow: hidden;\">Mod&egrave;le enveloppe</div>\r\n&Eacute;lections des membres des commissions nationales consultatives et des commissions nationales de recrutement ou de promotion au titre des ann&eacute;es 2014 et 2015 -&nbsp;<em><span style=\"text-decoration-line: underline;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3029\" target=\"_blank\" rel=\"noopener\">Circulaire n&deg;1 sous format PDF</a></span></em><br />\r\n<ul class=\"liste_pucebleu\" style=\"margin: 0px; padding: 0px 0px 5px 9px; list-style: none;\">\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><span style=\"font-size: 12px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3037\" target=\"_blank\" rel=\"noopener\">Liste des candidats pour les commissions nationales de recrutement au grade de professeur de l\'enseignement sup&eacute;rieur</a></span></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><span style=\"font-size: 12px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3036\" target=\"_blank\" rel=\"noopener\">Liste des candidats pour les commissions nationales de recrutement au grade de ma&icirc;tre de conf&eacute;rence de l\'enseignement sup&eacute;rieur</a></span></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><span style=\"font-size: 12px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3035\" target=\"_blank\" rel=\"noopener\">Liste des candidats pour les commissions nationales de recrutement ou de promotion au grade de ma&icirc;tre assistant de l\'enseignement sup&eacute;rieur</a></span></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><span style=\"font-size: 12px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3030\" target=\"_blank\" rel=\"noopener\">Liste des candidats pour les commissions nationales de recrutement au grade d\'assistant de l\'enseignement sup&eacute;rieur</a></span></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><span style=\"font-size: 12px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3033\" target=\"_blank\" rel=\"noopener\">Formulaire</a></span></li>\r\n<li style=\"margin: 0px; padding: 0px 0px 4px 20px; background: url(\'../image/gif/pucebleu_liste.gif\') 0px 6px no-repeat; border-bottom: none; line-height: 16px;\"><span style=\"font-size: 12px;\"><a style=\"outline: none; text-decoration-line: none;\" href=\"http://www.mes.tn/image.php?id=3032\" target=\"_blank\" rel=\"noopener\">Mod&egrave;le enveloppe</a></span></li>\r\n</ul>\r\n</li>\r\n</ul>', NULL, NULL, NULL, '2020-01-09 10:01:17', '2020-01-10 06:16:18', NULL, NULL, NULL, 'PUBLISHED', 'liste-des-circulaires-de-l-annee-2014', 0, 'Circulaire', 'منشور', 'Circular', 2014, '1', NULL, NULL, NULL, NULL),
(5, 'Décret n° 2010-3483 du 21 décembre 2010', 'أمر عدد 3483 لسنة 2010', NULL, '<p><span style=\"color: #252525; font-family: Arial, Helvetica, sans-serif; font-size: 11px;\">D&eacute;cret n&deg; 2010-3483 du 21 d&eacute;cembre 2010, portant transformation du caract&egrave;re de deux &eacute;tablissements publics de recherche scientifique. (voir JORT n&deg;1, p.11).</span></p>', '<p><span style=\"color: #252525; font-family: Arial, Helvetica, sans-serif; font-size: 11px;\">D&eacute;cret n&deg; 2010-3483 du 21 d&eacute;cembre 2010, portant transformation du caract&egrave;re de deux &eacute;tablissements publics de recherche scientifique. (voir JORT n&deg;1, p.11).</span></p>', NULL, NULL, '2020-01-10 06:48:34', '2020-03-02 04:24:28', NULL, NULL, NULL, 'PUBLISHED', 'decret-n-2010-3483-du-21-decembre-2010', 0, 'Décret', 'أمر', 'Decree', 2010, '1', '1', '1', '2020-03-02 09:24:28', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type_docs`
--

CREATE TABLE `type_docs` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_docs`
--

INSERT INTO `type_docs` (`id`, `created_at`, `updated_at`, `deleted_at`, `libelle`, `description`) VALUES
(1, '2020-04-09 08:20:26', '2020-04-09 08:20:26', NULL, 'شهادة عمل', '<p>Informations obligatoires :&nbsp;</p>\r\n<ol>\r\n<li>CIN</li>\r\n<li>ann&eacute; de travail&nbsp;</li>\r\n</ol>'),
(2, '2020-06-10 09:48:14', '2020-06-10 09:48:14', NULL, 'شهادة في الأجر', NULL),
(3, '2020-06-10 09:50:27', '2020-06-10 09:50:26', NULL, 'شهادة في خصم الأداء على الدخل', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users\\May2020\\oMM0jHstiuQN0pbVIR3A.png', NULL, '$2y$10$U5NTGfwhlyDILvIISG.sY.2rOPW6ZJZzmMKpFs6owftEOmf.T/Req', 'RfLiyK2hCf5abWbPrOxyGwD8c1PCn2Rtij5VTJut7bqL4ribvEfL9OU5FmRL', '{\"locale\":\"fr\"}', '2019-07-23 04:29:36', '2023-05-18 07:56:44');

-- --------------------------------------------------------

--
-- Structure de la table `user_admins`
--

CREATE TABLE `user_admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `NomPrenom` varchar(255) DEFAULT NULL,
  `Login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `DateDernierCnxion` datetime DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `RaisonSuspension` varchar(255) DEFAULT NULL,
  `DateSuspension` datetime DEFAULT NULL,
  `SuspenduPar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_admins`
--

INSERT INTO `user_admins` (`id`, `NomPrenom`, `Login`, `password`, `email`, `DateDernierCnxion`, `Etat`, `RaisonSuspension`, `DateSuspension`, `SuspenduPar`) VALUES
(1, 'thrt', 'rth', '$2y$10$rrwl5i1b0qjTJAb8.h1XZ.oTNItce5fVWeu/ShWPByRk19YpqLSq2', 'walid@gmail.com', '2020-05-21 16:48:40', '1', NULL, '2020-05-21 16:48:45', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnes`
--
ALTER TABLE `abonnes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `abonnes_email_unique` (`email`);

--
-- Index pour la table `accueil_composants`
--
ALTER TABLE `accueil_composants`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `actualites`
--
ALTER TABLE `actualites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `actualites_slug_unique` (`slug`);

--
-- Index pour la table `annuaire_etablissements`
--
ALTER TABLE `annuaire_etablissements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `appels_offres`
--
ALTER TABLE `appels_offres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `appels_offres_slug_unique` (`slug`);

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_slug_unique` (`slug`);

--
-- Index pour la table `articles_travaux_associations`
--
ALTER TABLE `articles_travaux_associations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `article_pieces_jointes`
--
ALTER TABLE `article_pieces_jointes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `budget_partcipatifs`
--
ALTER TABLE `budget_partcipatifs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Index pour la table `citoyens`
--
ALTER TABLE `citoyens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `citoyen_cin_unique` (`CIN`),
  ADD UNIQUE KEY `citoyen_email_unique` (`email`),
  ADD UNIQUE KEY `citoyen_login_unique` (`Login`);

--
-- Index pour la table `conseil_municipales`
--
ALTER TABLE `conseil_municipales`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cooperations`
--
ALTER TABLE `cooperations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Index pour la table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Index pour la table `demande_acces`
--
ALTER TABLE `demande_acces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `demandeacces_codedemande_unique` (`codeDemande`);

--
-- Index pour la table `demande_docs`
--
ALTER TABLE `demande_docs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `denonciations`
--
ALTER TABLE `denonciations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `emailnonenvoyes`
--
ALTER TABLE `emailnonenvoyes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `evenements`
--
ALTER TABLE `evenements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `evenements_slug_unique` (`slug`);

--
-- Index pour la table `finances`
--
ALTER TABLE `finances`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `galleries_slug_unique` (`slug`);

--
-- Index pour la table `liens`
--
ALTER TABLE `liens`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `listes_contacts`
--
ALTER TABLE `listes_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `list_articles`
--
ALTER TABLE `list_articles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Index pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Index pour la table `messagenewsletters`
--
ALTER TABLE `messagenewsletters`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messages_privates`
--
ALTER TABLE `messages_privates`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Index pour la table `permis_batir`
--
ALTER TABLE `permis_batir`
  ADD PRIMARY KEY (`Id_permis`);

--
-- Index pour la table `projets_realisations`
--
ALTER TABLE `projets_realisations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `protection_socio_enviros`
--
ALTER TABLE `protection_socio_enviros`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `raccourci_rapides`
--
ALTER TABLE `raccourci_rapides`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reclamations`
--
ALTER TABLE `reclamations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reclamation_codereclamation_unique` (`CodeReclamation`);

--
-- Index pour la table `reponse_demande_acces`
--
ALTER TABLE `reponse_demande_acces`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reponse_messages_privates`
--
ALTER TABLE `reponse_messages_privates`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reponse_reclamations`
--
ALTER TABLE `reponse_reclamations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reseau_sociales`
--
ALTER TABLE `reseau_sociales`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Index pour la table `sites_utiles`
--
ALTER TABLE `sites_utiles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `statistiques`
--
ALTER TABLE `statistiques`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `themes_slug_unique` (`slug`);

--
-- Index pour la table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Index pour la table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `types_slug_unique` (`slug`);

--
-- Index pour la table `type_docs`
--
ALTER TABLE `type_docs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Index pour la table `user_admins`
--
ALTER TABLE `user_admins`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonnes`
--
ALTER TABLE `abonnes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `accueil_composants`
--
ALTER TABLE `accueil_composants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `actualites`
--
ALTER TABLE `actualites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `annuaire_etablissements`
--
ALTER TABLE `annuaire_etablissements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `appels_offres`
--
ALTER TABLE `appels_offres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `articles_travaux_associations`
--
ALTER TABLE `articles_travaux_associations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `article_pieces_jointes`
--
ALTER TABLE `article_pieces_jointes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `budget_partcipatifs`
--
ALTER TABLE `budget_partcipatifs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `citoyens`
--
ALTER TABLE `citoyens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `conseil_municipales`
--
ALTER TABLE `conseil_municipales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `cooperations`
--
ALTER TABLE `cooperations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1239;

--
-- AUTO_INCREMENT pour la table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT pour la table `demande_acces`
--
ALTER TABLE `demande_acces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `demande_docs`
--
ALTER TABLE `demande_docs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `denonciations`
--
ALTER TABLE `denonciations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emailnonenvoyes`
--
ALTER TABLE `emailnonenvoyes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evenements`
--
ALTER TABLE `evenements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `finances`
--
ALTER TABLE `finances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `liens`
--
ALTER TABLE `liens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `listes_contacts`
--
ALTER TABLE `listes_contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `list_articles`
--
ALTER TABLE `list_articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT pour la table `messagenewsletters`
--
ALTER TABLE `messagenewsletters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messages_privates`
--
ALTER TABLE `messages_privates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=574;

--
-- AUTO_INCREMENT pour la table `permis_batir`
--
ALTER TABLE `permis_batir`
  MODIFY `Id_permis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `projets_realisations`
--
ALTER TABLE `projets_realisations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `protection_socio_enviros`
--
ALTER TABLE `protection_socio_enviros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `raccourci_rapides`
--
ALTER TABLE `raccourci_rapides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `reclamations`
--
ALTER TABLE `reclamations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `reponse_demande_acces`
--
ALTER TABLE `reponse_demande_acces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reponse_messages_privates`
--
ALTER TABLE `reponse_messages_privates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reponse_reclamations`
--
ALTER TABLE `reponse_reclamations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reseau_sociales`
--
ALTER TABLE `reseau_sociales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT pour la table `sites_utiles`
--
ALTER TABLE `sites_utiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `statistiques`
--
ALTER TABLE `statistiques`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `type_docs`
--
ALTER TABLE `type_docs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user_admins`
--
ALTER TABLE `user_admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

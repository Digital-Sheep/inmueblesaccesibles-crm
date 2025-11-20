-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-11-2025 a las 05:17:17
-- Versión del servidor: 12.0.2-MariaDB
-- Versión de PHP: 8.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmueblesaccesibles_crm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carteras`
--

CREATE TABLE `carteras` (
  `id` int(11) NOT NULL,
  `sucursal_id` int(11) NOT NULL COMMENT 'ID de la sucursal (cat_sucursales).',
  `administradora_id` int(11) NOT NULL COMMENT 'ID de la administradora (cat_administradoras).',
  `codigo` varchar(100) NOT NULL COMMENT 'Forma: ABR-ADMINISTRADORA_ABR-SUCURSAL_SUBCARTERA_AÑOMES',
  `nombre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por_usuario_id` int(11) NOT NULL,
  `actualizado_por_usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `carteras`
--

INSERT INTO `carteras` (`id`, `sucursal_id`, `administradora_id`, `codigo`, `nombre`, `created_at`, `updated_at`, `creado_por_usuario_id`, `actualizado_por_usuario_id`) VALUES
(4, 4, 1, 'ZEND_GDL_CKD_202505', 'Zendere Guadalajara Mayo 2025', '2025-06-29 01:19:00', '2025-06-29 01:19:00', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_administradoras`
--

CREATE TABLE `cat_administradoras` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_administradoras`
--

INSERT INTO `cat_administradoras` (`id`, `nombre`, `abreviatura`, `created_at`, `updated_at`) VALUES
(1, 'ZENDERE', 'ZEN', '2025-05-21 04:45:12', '2025-05-21 04:45:12'),
(2, 'PENDULUM', 'PEN', '2025-05-21 04:45:51', '2025-05-21 04:45:51'),
(3, 'BBVA', 'BBV', '2025-05-21 04:45:51', '2025-05-21 04:45:51'),
(4, 'ADANAMANTINE', 'ADA', '2025-05-21 04:46:20', '2025-05-21 04:46:20'),
(5, 'SANTANDER', 'SAN', '2025-05-21 04:46:20', '2025-05-21 04:46:20'),
(6, 'GLOSAN', 'GLO', '2025-05-21 04:46:40', '2025-05-21 04:46:40'),
(7, 'ADN', 'ADN', '2025-05-21 04:46:40', '2025-05-21 04:46:40'),
(8, 'OPERAX', 'OPE', '2025-05-21 04:47:02', '2025-05-21 04:47:02'),
(9, 'SHF', 'SHF', '2025-05-21 04:47:02', '2025-05-21 04:47:02'),
(10, 'GARANTIAS PROPIAS', 'GAR', '2025-05-21 04:47:20', '2025-05-21 04:47:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_clasificacion_legal_propiedad`
--

CREATE TABLE `cat_clasificacion_legal_propiedad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_clasificacion_legal_propiedad`
--

INSERT INTO `cat_clasificacion_legal_propiedad` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Pendiente Dictamen', 'Propiedad pendiente de estudio jurídico y clasificación R1/R2.', '2025-05-23 07:06:54', '2025-05-23 07:06:54'),
(2, 'R1 (Negativa)', 'Dictamen jurídico negativo.', '2025-05-23 07:06:54', '2025-05-23 07:07:16'),
(3, 'R2 (Positiva)', 'Dictamen jurídico positivo.', '2025-05-23 07:06:54', '2025-05-23 07:07:24'),
(4, 'En Proceso de Cambio (RV)', 'Propiedad en proceso de cambio R3.', '2025-05-23 07:06:54', '2025-05-23 07:08:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_estados`
--

CREATE TABLE `cat_estados` (
  `id` int(11) NOT NULL,
  `clave_entidad` varchar(80) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `abreviatura` varchar(80) NOT NULL,
  `pais_code` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_estados`
--

INSERT INTO `cat_estados` (`id`, `clave_entidad`, `nombre`, `abreviatura`, `pais_code`) VALUES
(1, '01', 'Aguascalientes', 'Ags.', 'MX'),
(2, '02', 'Baja California', 'BC', 'MX'),
(3, '03', 'Baja California Sur', 'BCS', 'MX'),
(4, '04', 'Campeche', 'Camp.', 'MX'),
(5, '05', 'Coahuila de Zaragoza', 'Coah.', 'MX'),
(6, '06', 'Colima', 'Col.', 'MX'),
(7, '07', 'Chiapas', 'Chis.', 'MX'),
(8, '08', 'Chihuahua', 'Chih.', 'MX'),
(9, '09', 'Estado de México', 'Edo Mex.', 'MX'),
(10, '10', 'Durango', 'Dgo.', 'MX'),
(11, '11', 'Guanajuato', 'Gto.', 'MX'),
(12, '12', 'Guerrero', 'Gro.', 'MX'),
(13, '13', 'Hidalgo', 'Hgo.', 'MX'),
(14, '14', 'Jalisco', 'Jal.', 'MX'),
(15, '15', 'México', 'Mex.', 'MX'),
(16, '16', 'Michoacán de Ocampo', 'Mich.', 'MX'),
(17, '17', 'Morelos', 'Mor.', 'MX'),
(18, '18', 'Nayarit', 'Nay.', 'MX'),
(19, '19', 'Nuevo León', 'NL', 'MX'),
(20, '20', 'Oaxaca', 'Oax.', 'MX'),
(21, '21', 'Puebla', 'Pue.', 'MX'),
(22, '22', 'Querétaro', 'Qro.', 'MX'),
(23, '23', 'Quintana Roo', 'Q. Roo', 'MX'),
(24, '24', 'San Luis Potosí', 'SLP', 'MX'),
(25, '25', 'Sinaloa', 'Sin.', 'MX'),
(26, '26', 'Sonora', 'Son.', 'MX'),
(27, '27', 'Tabasco', 'Tab.', 'MX'),
(28, '28', 'Tamaulipas', 'Tamps.', 'MX'),
(29, '29', 'Tlaxcala', 'Tlax.', 'MX'),
(30, '30', 'Veracruz', 'Ver.', 'MX'),
(31, '31', 'Yucatán', 'Yuc.', 'MX'),
(32, '32', 'Zacatecas', 'Zac.', 'MX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_estados_civiles`
--

CREATE TABLE `cat_estados_civiles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_estados_civiles`
--

INSERT INTO `cat_estados_civiles` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Soltero(a)', NULL, '2025-05-23 07:42:24', '2025-05-23 07:42:24'),
(2, 'Casado(a)', NULL, '2025-05-23 07:42:24', '2025-05-23 07:42:24'),
(3, 'Divorciado(a)', NULL, '2025-05-23 07:42:24', '2025-05-23 07:42:24'),
(4, 'Viudo(a)', NULL, '2025-05-23 07:42:24', '2025-05-23 07:42:24'),
(5, 'Unión Libre', NULL, '2025-05-23 07:42:24', '2025-05-23 07:42:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_estatus_cliente`
--

CREATE TABLE `cat_estatus_cliente` (
  `id` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_estatus_cliente`
--

INSERT INTO `cat_estatus_cliente` (`id`, `orden`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 10, 'Comprobante de Pago Recibido', 'El comprobante de pago del apartado ha sido subido al sistema. Pendiente de validación.', '2025-05-23 07:29:10', '2025-05-23 07:29:10'),
(2, 20, 'Pago Validado', 'El pago del apartado ha sido validado por las áreas correspondientes. Pendiente generación de contrato.', '2025-05-23 07:29:10', '2025-05-23 07:29:10'),
(3, 30, 'Contrato Final Generado', 'El contrato final de compraventa ha sido generado por Jurídico. Pendiente de validación interna.', '2025-05-23 07:29:10', '2025-05-23 07:29:10'),
(4, 40, 'Contrato Final Validado', 'El contrato final ha sido validado por todas las áreas internas. Pendiente firma con notario.', '2025-05-23 07:29:10', '2025-05-23 07:29:10'),
(5, 50, 'Contrato Final Firmado', 'El contrato final ha sido firmado por el cliente y las partes. Pendiente cierre de proceso.', '2025-05-23 07:29:10', '2025-05-23 07:29:10'),
(6, 60, 'Formalizado / Venta Concretada', 'El proceso de venta ha concluido exitosamente y la propiedad ha sido transferida.', '2025-05-23 07:29:10', '2025-05-23 07:29:10'),
(7, 70, 'Descartado Proceso Cliente', 'El cliente no continuó con el proceso o fue rechazado en esta etapa.', '2025-05-23 07:29:10', '2025-05-23 07:29:10'),
(8, 80, 'Rechazado Proceso Cliente', 'El cliente o la propiedad no cumplió con los requisitos en la fase de proceso cliente.', '2025-05-23 07:29:10', '2025-05-23 07:29:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_estatus_global_prospecto`
--

CREATE TABLE `cat_estatus_global_prospecto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Define los estados globales del ciclo de vida de un prospecto.';

--
-- Volcado de datos para la tabla `cat_estatus_global_prospecto`
--

INSERT INTO `cat_estatus_global_prospecto` (`id`, `nombre`, `descripcion`, `orden`) VALUES
(1, 'Contacto Inicial', 'El prospecto acaba de ser registrado en el sistema.', 10),
(2, 'Aviso de Privacidad Recibido', 'El prospecto ha entregado el aviso de privacidad firmado.', 20),
(3, 'Activo con Procesos de Venta', 'El prospecto ya tiene al menos un proceso de venta activo y su gestión continúa a nivel de proceso.', 30),
(4, 'Convertido a Cliente', 'El prospecto ha sido convertido a cliente y su gestión pasa al módulo de clientes.', 40),
(5, 'Descartado', 'El prospecto ha sido descartado y no continuará en el flujo.', 99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_estatus_juridico_propiedad`
--

CREATE TABLE `cat_estatus_juridico_propiedad` (
  `id` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_estatus_juridico_propiedad`
--

INSERT INTO `cat_estatus_juridico_propiedad` (`id`, `orden`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 1, 'Presentación de demanda', NULL, '2025-05-23 05:01:40', '2025-05-23 05:01:40'),
(2, 2, 'Auto admisorio', NULL, '2025-05-23 05:01:40', '2025-05-23 05:01:40'),
(3, 3, 'Emplazamiento', NULL, '2025-05-23 05:01:40', '2025-05-23 05:01:40'),
(4, 4, 'Contestación de demanda', NULL, '2025-05-23 05:01:40', '2025-05-23 05:01:40'),
(5, 5, 'Sentencia definitiva', NULL, '2025-05-23 05:01:40', '2025-05-23 05:01:40'),
(6, 6, 'Ejecución de sentencia', NULL, '2025-05-23 05:01:40', '2025-05-23 05:01:40'),
(7, 7, 'Avalúos', NULL, '2025-05-23 05:01:40', '2025-05-23 05:01:40'),
(8, 8, 'Lanzamiento de remate', NULL, '2025-05-23 05:01:40', '2025-05-23 05:01:40'),
(9, 9, 'Adjudicación', NULL, '2025-05-23 05:01:40', '2025-05-23 05:01:40'),
(10, 10, 'Toma de Posesión', NULL, '2025-05-23 05:01:40', '2025-05-23 05:01:40'),
(11, 11, 'Escrituración', NULL, '2025-05-23 05:01:40', '2025-05-23 05:01:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_estatus_legal_cliente`
--

CREATE TABLE `cat_estatus_legal_cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_estatus_legal_cliente`
--

INSERT INTO `cat_estatus_legal_cliente` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'En Estudio', 'El cliente/prospecto se encuentra en fase inicial o pendiente de dictamen de propiedad.', '2025-05-23 07:12:35', '2025-05-23 07:12:35'),
(2, 'Asociado a Propiedad R2', 'El cliente/prospecto está asociado a una propiedad con dictamen positivo (R2).', '2025-05-23 07:12:35', '2025-05-23 07:12:35'),
(3, 'Cliente RV', 'El cliente/prospecto está asociado a una propiedad con dictamen negativo (R1) y busca un cambio de propiedad.', '2025-05-23 07:12:35', '2025-05-23 07:12:35'),
(4, 'Cambio Efectivo (R3)', 'El proceso de cambio de propiedad del cliente RV ha sido exitoso, obteniendo una nueva propiedad.', '2025-05-23 07:12:35', '2025-05-23 07:12:35'),
(5, 'Proceso RV Fallido', 'El cliente RV ha concluido su proceso de cambio sin asignación de nueva propiedad.', '2025-05-23 07:12:35', '2025-05-23 07:14:26'),
(6, 'Proceso de Cesion', 'Cliente/prospecto asociado a propiedad R2, en proceso de cesión de la misma.', '2025-05-23 07:12:35', '2025-05-23 07:12:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_estatus_prospeccion`
--

CREATE TABLE `cat_estatus_prospeccion` (
  `id` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_estatus_prospeccion`
--

INSERT INTO `cat_estatus_prospeccion` (`id`, `orden`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 10, 'Proceso de Venta Iniciado', 'Se ha ligado una propiedad de interés al prospecto.', '2025-05-23 07:20:38', '2025-07-05 18:55:07'),
(2, 20, 'Visita a Propiedad Realizada', 'El prospecto ha visitado físicamente la propiedad.', '2025-05-23 07:20:38', '2025-07-05 18:55:58'),
(3, 30, 'Contrato de Apartado Generado', 'Se ha generado el folio y el PDF del contrato de apartado.', '2025-05-23 07:20:38', '2025-07-05 18:56:48'),
(4, 40, 'Comprobante de Pago Subido', 'El prospecto ha subido su comprobante de pago del apartado.', '2025-05-23 07:20:38', '2025-07-05 18:57:07'),
(5, 50, 'Pago Validado / Convertido a Cliente', 'El pago ha sido validado y el prospecto ahora es un cliente formal.', '2025-05-23 07:20:38', '2025-07-05 18:57:30'),
(6, 60, 'Solicitud de Contrato Generada', 'Se ha solicitado la elaboración del contrato. Pendiente de generación por el área administrativa.', '2025-07-26 18:23:40', '2025-07-26 18:23:40'),
(7, 70, 'Contrato Generado (En Validación)', 'El borrador del contrato ha sido creado y está pendiente de validación por las áreas correspondientes.', '2025-07-26 18:23:40', '2025-07-26 18:23:40'),
(8, 80, 'Contrato Validado y Cargado', 'El contrato ha sido validado y la versión final se ha adjuntado al expediente.', '2025-07-26 18:23:40', '2025-07-26 18:23:40'),
(9, 90, 'Contrato Firmado Recibido', 'El cliente ha firmado el contrato y el documento final se ha subido al sistema.', '2025-07-26 18:23:40', '2025-07-26 18:23:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_municipios`
--

CREATE TABLE `cat_municipios` (
  `id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `clave_entidad` varchar(10) NOT NULL,
  `clave_municipio` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `clave_cabecera` varchar(10) NOT NULL,
  `nombre_cabecera` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_paises`
--

CREATE TABLE `cat_paises` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_paises`
--

INSERT INTO `cat_paises` (`id`, `nombre`, `codigo`) VALUES
(1, 'México', 'MX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_permisos`
--

CREATE TABLE `cat_permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `modulo` varchar(50) DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_permisos`
--

INSERT INTO `cat_permisos` (`id`, `nombre`, `descripcion`, `modulo`, `accion`, `created_at`, `updated_at`) VALUES
(1, 'propiedades.ver', 'Permite acceder al módulo de propiedades y ver el listado de propiedades.', 'propiedades', 'ver', '2025-05-24 04:43:37', '2025-05-24 04:43:37'),
(2, 'propiedades.ver.todo', 'Permite ver todas las propiedades del sistema sin restricciones de sucursal.', 'propiedades', 'ver.todo', '2025-05-24 04:43:37', '2025-05-24 08:47:32'),
(3, 'propiedades.crear', 'Permite añadir nuevas propiedades al sistema.', 'propiedades', 'crear', '2025-05-24 04:43:37', '2025-05-24 04:43:37'),
(4, 'propiedades.editar', 'Permite modificar los datos de cualquier propiedad en el sistema.', 'propiedades', 'editar', '2025-05-24 04:43:37', '2025-05-24 04:43:37'),
(5, 'propiedades.eliminar', 'Permite eliminar propiedades del sistema.', 'propiedades', 'eliminar', '2025-05-24 04:43:37', '2025-05-24 04:43:37'),
(6, 'propiedades.cargar.cartera', 'Permite acceder a la funcionalidad de carga de carteras de propiedades \"en bruto\".', 'propiedades', 'cargar.cartera', '2025-05-24 04:43:37', '2025-05-24 04:43:37'),
(7, 'administradoras.ver_nombres', 'Permite ver el nombre de las Administradoras', 'administradoras', 'ver_nombres', '2025-06-04 03:24:14', '2025-06-28 05:50:48'),
(8, 'validaciones_cartera.ver', 'Permite ver y acceder al módulo de validaciones de cartera.', 'validaciones_cartera', 'ver', '2025-06-04 03:26:11', '2025-06-04 03:26:11'),
(9, 'validaciones_cartera.validar', 'Permite validar propiedades.', 'validaciones_cartera', 'validar', '2025-06-04 03:26:59', '2025-06-04 03:26:59'),
(11, 'validaciones_cartera.ver.todo', 'Permite ver todas las propiedades pendientes de validar sin restricciones de sucursal.', 'validaciones_cartera', 'ver.todo', '2025-06-11 07:07:25', '2025-06-11 07:07:25'),
(12, 'catalogos.ver', 'Da acceso a la API para obtener catálogos.', 'catalogo', 'ver', '2025-06-11 07:08:22', '2025-06-11 07:18:32'),
(13, 'prospectos.ver', 'Permite acceder al módulo de prospectos.', 'prospectos', 'ver', '2025-06-11 07:09:07', '2025-06-11 07:09:07'),
(14, 'prospectos.ver.todo', 'Permite ver todos los prospectos del sistema sin restricciones de sucursal.', 'prospectos', 'ver.todo', '2025-06-11 07:09:40', '2025-06-11 07:09:40'),
(15, 'prospectos.seguimiento.crear', 'Permite agregar un registro de seguimiento al prospecto.', 'prospectos', 'seguimiento.crear', '2025-06-13 05:55:23', '2025-06-13 05:55:23'),
(16, 'usuarios.ver_todos', 'Permiso para poder ver la lista de usuarios.', 'usuarios', 'ver_todos', '2025-06-13 07:22:20', '2025-06-28 22:43:44'),
(17, 'prospectos.workflow.gestionar', 'Permiso para poder gestionar el flujo de estado del prospecto', 'prospectos', 'workflow.gestionar', '2025-06-20 05:15:47', '2025-06-20 05:15:47'),
(18, 'procesos_venta.crear', 'crear', 'procesos_venta', 'crear', '2025-06-20 05:29:40', '2025-06-20 05:29:40'),
(19, 'prospectos.crear', 'Permite agregar prospectos', 'prospectos', 'crear', '2025-06-28 23:03:24', '2025-06-28 23:03:24'),
(20, 'prospectos.editar', 'Permite editar prospectos', 'prospectos', 'editar', '2025-06-28 23:37:30', '2025-06-28 23:37:30'),
(21, 'prospectos.documentos.ver', 'Permite ver los documentos de los prospectos.', 'prospectos', 'documentos.ver', '2025-07-01 07:07:05', '2025-07-01 07:07:05'),
(22, 'procesos_venta.ver', 'Permite ver los procesos de venta', 'procesos_venta', 'ver', '2025-07-05 06:42:55', '2025-07-05 06:42:55'),
(23, 'procesos_venta.ver_seguimiento', 'Permite ver los seguimientos de un proceso de venta.', 'procesos_venta', 'ver_seguimiento', '2025-07-05 06:50:55', '2025-07-05 06:50:55'),
(24, 'procesos_venta.ver_documentos', 'Permite ver los documentos de un proceso de venta.', 'procesos_venta', 'ver_documentos', '2025-07-05 06:51:28', '2025-07-05 06:51:28'),
(25, 'procesos_venta.update', 'Permite actualizar los procesos de venta.', 'procesos_venta', 'update', '2025-07-05 08:25:38', '2025-07-05 08:25:38'),
(26, 'procesos_venta.seguimiento.crear', 'Permite crear seguimientos en los procesos de venta.', 'procesos_venta', 'crear', '2025-07-05 08:26:06', '2025-07-05 08:26:06'),
(27, 'procesos_venta.workflow.gestionar', 'Permite gestionar los avances del proceso de venta.', 'procesos_venta', 'workflow.gestionar', '2025-07-05 08:26:40', '2025-07-05 08:26:40'),
(29, 'procesos_venta.generar_folio', 'Permite generar folios de apartado.', 'procesos_venta', 'generar_folio', '2025-07-11 07:30:18', '2025-07-11 07:30:18'),
(30, 'folios_apartado.ver', 'Permite ver los folios de apartado.', 'folios_apartado', 'ver', '2025-07-12 06:05:07', '2025-07-12 06:05:07'),
(31, 'procesos_venta.subir_comprobante', 'Permiso para subir el comprobante de apartado.', 'procesos_venta', 'subir_comprobante', '2025-07-12 07:10:34', '2025-07-12 07:10:56'),
(32, 'clientes.convertir', 'Permiso para convertir un prospecto a un cliente. (Esto se realiza al validar el pago de apartado).', 'clientes', 'convertir', '2025-07-12 20:08:39', '2025-07-12 20:08:39'),
(33, 'clientes.ver', 'Permite ver el módulo de clientes.', 'clientes', 'ver', '2025-07-12 20:51:36', '2025-07-12 20:51:36'),
(34, 'clientes.ver_seguimiento', 'Permite ver el seguimiento de venta de los clientes.', 'clientes', 'ver_seguimiento', '2025-07-12 21:45:36', '2025-07-19 18:34:29'),
(35, 'clientes.ver_documentos', 'Permite ver los documentos de los clientes.', 'clientes', 'ver_documentos', '2025-07-12 21:46:26', '2025-07-12 21:46:26'),
(36, 'usuarios.editar', 'Permite editar usuarios.', 'usuarios', 'editar', '2025-07-17 07:07:19', '2025-07-17 07:07:19'),
(37, 'usuarios.crear', 'Permite crear usuarios.', 'usuarios', 'crear', '2025-07-17 07:08:41', '2025-07-17 07:08:41'),
(38, 'usuarios.eliminar', 'Permite eliminar usuarios.', 'usuarios', 'eliminar', '2025-07-17 07:18:28', '2025-07-17 07:18:28'),
(39, 'usuarios.ver', 'Permite ver el módulo de usuarios.', 'usuarios', 'ver', '2025-07-17 07:37:57', '2025-07-17 07:37:57'),
(40, 'administradoras.ver', NULL, 'administradoras', 'ver', '2025-07-17 07:51:41', '2025-07-17 07:51:41'),
(41, 'administradoras.crear', 'Permite crear administradoras nuevas.', 'administradoras', 'crear', '2025-07-17 07:52:04', '2025-07-19 18:06:17'),
(42, 'administradoras.editar', NULL, 'administradoras', 'editar', '2025-07-17 07:52:28', '2025-07-17 07:52:28'),
(43, 'administradoras.eliminar', NULL, 'administradoras', 'eliminar', '2025-07-17 07:52:51', '2025-07-17 07:52:51'),
(44, 'sucursales.ver', 'Permite ver el módulo de sucursales.', 'sucursales', 'ver', '2025-07-17 08:25:32', '2025-07-17 08:25:32'),
(45, 'sucursales.crear', 'Permite crear nuevas sucursales.', 'sucursales', 'crear', '2025-07-17 08:27:25', '2025-07-17 08:27:25'),
(46, 'sucursales.editar', 'Permite editar sucursales.', 'sucursales', 'editar', '2025-07-17 08:27:55', '2025-07-17 08:27:55'),
(47, 'sucursales.eliminar', 'Permite eliminar sucursales.', 'sucursales', 'eliminar', '2025-07-17 08:28:20', '2025-07-17 08:28:20'),
(48, 'permisos.ver', 'Permite ver los permisos.', 'permisos', 'ver', '2025-07-18 04:59:38', '2025-07-18 04:59:38'),
(49, 'permisos.editar', 'Permite editar los permisos.', 'permisos', 'editar', '2025-07-18 05:04:07', '2025-07-18 05:04:07'),
(50, 'permisos.eliminar', 'Permite eliminar permisos.', 'permisos', 'eliminar', '2025-07-18 05:09:13', '2025-07-18 05:09:13'),
(51, 'roles.ver', 'Permite ver el módulo de roles.', 'roles', 'ver', '2025-07-18 05:22:46', '2025-07-18 05:22:46'),
(52, 'roles.editar', 'Permite editar roles.', 'roles', 'editar', '2025-07-18 05:23:38', '2025-07-18 05:23:38'),
(53, 'roles.crear', 'Permite crear roles.', 'roles', 'crear', '2025-07-18 05:25:47', '2025-07-18 05:25:47'),
(55, 'roles.eliminar', 'Permite eliminar roles.', 'roles', 'eliminar', '2025-07-18 05:28:10', '2025-07-18 05:28:10'),
(57, 'prospectos.eliminar', 'Permite eliminar prospectos.', 'prospectos', 'eliminar', '2025-07-19 18:44:57', '2025-07-19 18:44:57'),
(58, 'pagos.validar', 'Permite ingresar al módulo de validaciones de pagos.', 'pagos', 'validar', '2025-07-22 01:15:29', '2025-07-22 01:15:29'),
(59, 'contratos.solicitar', 'Permite solicitar el contrato de un proceso de venta.', 'contratos', 'solicitar', '2025-07-26 20:07:11', '2025-07-26 20:07:11'),
(60, 'contratos.gestionar', 'Permite entrar al módulo para gestionar los contratos.', 'contratos', 'gestionar', '2025-07-26 22:12:17', '2025-07-26 22:12:17'),
(61, 'contratos.validar', 'Permite validar contratos.', 'contratos', 'validar', '2025-08-04 03:20:38', '2025-08-04 03:20:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_resultados_seguimiento`
--

CREATE TABLE `cat_resultados_seguimiento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `activa_escalamiento_a_rol` int(11) DEFAULT NULL COMMENT 'ID del rol a notificar si se selecciona este resultado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat_resultados_seguimiento`
--

INSERT INTO `cat_resultados_seguimiento` (`id`, `nombre`, `descripcion`, `activa_escalamiento_a_rol`) VALUES
(1, 'Interesado', NULL, NULL),
(2, 'Cita Agendada', NULL, NULL),
(3, 'Venta Concretada', NULL, NULL),
(4, 'No Agendó Cita', NULL, 7),
(5, 'Venta No Concretada', NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_roles`
--

CREATE TABLE `cat_roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_roles`
--

INSERT INTO `cat_roles` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Dirección', NULL, '2025-05-21 04:11:43', '2025-05-21 04:11:43'),
(2, 'Gerente Administrativo', NULL, '2025-05-21 04:12:24', '2025-07-05 21:48:56'),
(3, 'Gerente Comercial', NULL, '2025-05-21 04:12:36', '2025-05-21 04:19:18'),
(4, 'Gerente de Sucursal', NULL, '2025-05-21 04:19:34', '2025-07-05 21:49:30'),
(5, 'Asesor', NULL, '2025-05-21 04:19:52', '2025-07-05 21:49:19'),
(6, 'Contabilidad', NULL, '2025-05-21 04:20:07', '2025-05-21 04:20:07'),
(7, 'Dirección de Jurídico', NULL, '2025-05-21 04:20:25', '2025-05-21 04:20:25'),
(8, 'Prueba', NULL, '2025-07-19 18:07:43', '2025-07-19 18:07:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_sucursales`
--

CREATE TABLE `cat_sucursales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_sucursales`
--

INSERT INTO `cat_sucursales` (`id`, `nombre`, `abreviatura`, `created_at`, `updated_at`) VALUES
(1, 'Culiacán', 'CUL', '2025-05-21 04:13:56', '2025-05-21 04:13:56'),
(2, 'Mazatlán', 'MAZ', '2025-05-21 04:14:13', '2025-05-21 04:14:13'),
(3, 'La Paz', 'LP', '2025-05-21 04:14:28', '2025-05-21 04:14:28'),
(4, 'Guadalajara', 'GDL', '2025-05-21 04:14:43', '2025-05-21 04:14:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_tipos_documento_cliente`
--

CREATE TABLE `cat_tipos_documento_cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_tipos_documento_cliente`
--

INSERT INTO `cat_tipos_documento_cliente` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Aviso de Privacidad', 'Documento que el cliente firma al inicio de la relación.', '2025-05-24 03:34:51', '2025-05-24 03:34:51'),
(2, 'Comprobante de Pago Apartado', 'Comprobante del pago inicial del apartado de la propiedad.', '2025-05-24 03:34:51', '2025-05-24 03:34:51'),
(3, 'INE/Identificación Oficial', 'Identificación oficial del cliente.', '2025-05-24 03:34:51', '2025-05-24 03:34:51'),
(4, 'Comprobante de Domicilio', 'Documento que acredita el domicilio del cliente.', '2025-05-24 03:34:51', '2025-05-24 03:34:51'),
(5, 'Acta de Nacimiento', 'Acta de nacimiento del cliente.', '2025-05-24 03:34:51', '2025-05-24 03:34:51'),
(6, 'CURP', 'Clave Única de Registro de Población del cliente.', '2025-05-24 03:34:51', '2025-05-24 03:34:51'),
(7, 'Constancia de Situación Fiscal (RFC)', 'Documento fiscal del cliente.', '2025-05-24 03:34:51', '2025-05-24 03:34:51'),
(8, 'Contrato de Apartado', 'Contrato generado por el vendedor al apartar la propiedad.', '2025-05-24 03:34:51', '2025-05-24 03:34:51'),
(9, 'Contrato Final de Compraventa', 'Contrato definitivo de la transacción de compraventa de la propiedad.', '2025-05-24 03:34:51', '2025-05-24 03:34:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_tipos_documento_venta`
--

CREATE TABLE `cat_tipos_documento_venta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_propietario_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_tipos_documento_venta`
--

INSERT INTO `cat_tipos_documento_venta` (`id`, `nombre`, `tipo_propietario_id`, `created_at`, `updated_at`) VALUES
(1, 'Escritura', 1, '2025-05-23 05:02:51', '2025-05-23 05:02:51'),
(2, 'Cesión de derechos con escritura', 1, '2025-05-23 05:02:51', '2025-05-23 05:02:51'),
(3, 'Intextamentado', 1, '2025-05-23 05:02:51', '2025-05-23 05:02:51'),
(4, 'Renta', 1, '2025-05-23 05:02:51', '2025-05-23 05:02:51'),
(5, 'Contrato de prestación de servicios', 2, '2025-05-23 05:02:51', '2025-05-23 05:02:51'),
(6, 'Contrato de renta', 2, '2025-05-23 05:02:51', '2025-05-23 05:02:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_tipos_evento_agenda`
--

CREATE TABLE `cat_tipos_evento_agenda` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `color_hex` varchar(7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_tipos_evento_agenda`
--

INSERT INTO `cat_tipos_evento_agenda` (`id`, `nombre`, `descripcion`, `color_hex`, `created_at`, `updated_at`) VALUES
(1, 'Cita Venta', NULL, '#4e73df', '2025-05-23 08:18:24', '2025-05-23 08:18:24'),
(2, 'Visita Propiedad', NULL, '#1cc88a', '2025-05-23 08:18:24', '2025-05-23 08:18:24'),
(3, 'Cita Oficina', NULL, '#fd7e14', '2025-05-23 08:18:24', '2025-05-23 08:18:24'),
(4, 'Con Notario', NULL, '#36b9cc', '2025-05-23 08:18:24', '2025-05-23 08:18:24'),
(5, 'Reunion Interna', NULL, '#f6c23e', '2025-05-23 08:18:24', '2025-05-23 08:18:24'),
(6, 'Llamada', NULL, '#858796', '2025-05-23 08:18:24', '2025-05-23 08:18:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_tipos_pago`
--

CREATE TABLE `cat_tipos_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_tipos_pago`
--

INSERT INTO `cat_tipos_pago` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Apartado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_tipos_propietario`
--

CREATE TABLE `cat_tipos_propietario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cat_tipos_propietario`
--

INSERT INTO `cat_tipos_propietario` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Propia', NULL, '2025-05-23 05:02:04', '2025-05-23 05:02:04'),
(2, 'Terceros', NULL, '2025-05-23 05:02:04', '2025-05-23 05:02:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `celular` varchar(20) NOT NULL,
  `dial_code` varchar(5) DEFAULT NULL,
  `pais_code` varchar(5) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `lugar_nacimiento` varchar(100) DEFAULT NULL,
  `estado_civil_id` tinyint(4) DEFAULT NULL,
  `ocupacion` varchar(50) DEFAULT NULL,
  `curp` varchar(18) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `municipio_id` int(11) DEFAULT NULL,
  `sucursal_id` int(11) NOT NULL,
  `prospecto_origen_id` int(11) DEFAULT NULL,
  `usuario_responsable_id` int(11) NOT NULL,
  `folio_id` int(11) DEFAULT NULL,
  `estatus_cliente_legal_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por_usuario_id` int(11) NOT NULL,
  `actualizado_por_usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre_completo`, `email`, `celular`, `dial_code`, `pais_code`, `nacionalidad`, `fecha_nacimiento`, `lugar_nacimiento`, `estado_civil_id`, `ocupacion`, `curp`, `rfc`, `direccion`, `estado_id`, `municipio_id`, `sucursal_id`, `prospecto_origen_id`, `usuario_responsable_id`, `folio_id`, `estatus_cliente_legal_id`, `created_at`, `updated_at`, `creado_por_usuario_id`, `actualizado_por_usuario_id`) VALUES
(4, 'Juan Pérez 2', 'juan2@mail.com', '3333333333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 9, 4, NULL, NULL, '2025-07-26 17:36:21', '2025-07-26 17:36:21', 4, 4),
(5, 'María', 'maria@mail.com', 'Savala', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 11, 1, NULL, NULL, '2025-08-13 20:26:28', '2025-08-13 20:26:28', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato_validaciones`
--

CREATE TABLE `contrato_validaciones` (
  `id` int(11) NOT NULL,
  `solicitud_contrato_id` int(11) NOT NULL,
  `rol_id_requerido` int(11) NOT NULL,
  `estatus_validacion` enum('pendiente','aprobado','rechazado') NOT NULL DEFAULT 'pendiente',
  `validado_por_usuario_id` int(11) DEFAULT NULL,
  `fecha_validacion` datetime DEFAULT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contrato_validaciones`
--

INSERT INTO `contrato_validaciones` (`id`, `solicitud_contrato_id`, `rol_id_requerido`, `estatus_validacion`, `validado_por_usuario_id`, `fecha_validacion`, `comentarios`, `created_at`) VALUES
(1, 2, 1, 'aprobado', 1, '2025-08-13 20:42:05', 'Todo ok', '2025-08-13 20:33:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dictamenes_juridicos`
--

CREATE TABLE `dictamenes_juridicos` (
  `id` int(11) NOT NULL,
  `propiedad_id` int(11) NOT NULL,
  `tipo_dictamen_id` int(11) NOT NULL,
  `fecha_dictamen` date NOT NULL,
  `usuario_dictamina_id` int(11) NOT NULL,
  `comentarios` text DEFAULT NULL,
  `ruta_documento` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_clientes`
--

CREATE TABLE `documentos_clientes` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `prospecto_id` int(11) DEFAULT NULL,
  `proceso_venta_id` int(11) DEFAULT NULL,
  `tipo_documento_id` int(11) NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `subido_por_usuario_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por_usuario_id` int(11) NOT NULL,
  `actualizado_por_usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `documentos_clientes`
--

INSERT INTO `documentos_clientes` (`id`, `cliente_id`, `prospecto_id`, `proceso_venta_id`, `tipo_documento_id`, `nombre_archivo`, `ruta_archivo`, `subido_por_usuario_id`, `created_at`, `updated_at`, `creado_por_usuario_id`, `actualizado_por_usuario_id`) VALUES
(8, NULL, 9, NULL, 1, '687be8d7a3421-pago_de_apartado.pdf', 'documentos/prospectos/9/687be8d7a3421-pago_de_apartado.pdf', 4, '2025-07-19 18:49:59', '2025-07-19 18:49:59', 4, NULL),
(22, NULL, NULL, 10, 2, 'GDL-ZEN-0001.pdf', 'comprobantes_pago/10/pago_68850cf9c755b-GDL-ZEN-0001.pdf', 4, '2025-07-26 17:14:33', '2025-07-26 17:14:33', 4, NULL),
(23, NULL, NULL, 10, 8, 'GDL-ZEN-0001.pdf', 'contratos_finales/10/contrato_688e3f0caa192-GDL-ZEN-0001.pdf', 4, '2025-08-02 16:38:36', '2025-08-02 16:40:11', 4, NULL),
(24, NULL, 11, NULL, 1, '689cf1b3980f1-Guia_Alta Cuenta_Whatsapp_WABA_Continua .pdf', 'documentos/prospectos/11/689cf1b3980f1-Guia_Alta Cuenta_Whatsapp_WABA_Continua .pdf', 1, '2025-08-13 20:12:35', '2025-08-13 20:12:35', 1, NULL),
(25, NULL, NULL, 11, 2, 'GDL-ZEN-0002.pdf', 'comprobantes_pago/11/pago_689cf4a2c7175-GDL-ZEN-0002.pdf', 1, '2025-08-13 20:25:06', '2025-08-13 20:25:06', 1, NULL),
(26, NULL, NULL, 11, 8, 'zeekr_marca.pdf', 'contratos_finales/11/contrato_689cf68b2f413-zeekr_marca.pdf', 1, '2025-08-13 20:33:15', '2025-08-13 20:33:15', 1, NULL),
(27, NULL, NULL, 11, 4, 'GDL-ZEN-0002.pdf', 'contratos_firmados/11/contrato_firmado_689cf8b404cc6-GDL-ZEN-0002.pdf', 1, '2025-08-13 20:42:28', '2025-08-13 20:42:28', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos_agenda`
--

CREATE TABLE `eventos_agenda` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo_evento_id` int(11) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `es_todo_el_dia` tinyint(1) DEFAULT 0,
  `cliente_id` int(11) DEFAULT NULL,
  `prospecto_id` int(11) DEFAULT NULL,
  `propiedad_id` int(11) DEFAULT NULL,
  `usuario_creador_id` int(11) NOT NULL,
  `usuario_asignado_id` int(11) NOT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `folios_apartados`
--

CREATE TABLE `folios_apartados` (
  `id` int(11) NOT NULL,
  `sucursal_id` int(11) NOT NULL,
  `folio` varchar(50) NOT NULL,
  `ruta_pdf` varchar(255) DEFAULT NULL,
  `usuario_propietario_id` int(11) NOT NULL,
  `estatus_folio_id` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por_usuario_id` int(11) NOT NULL,
  `actualizado_por_usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `folios_apartados`
--

INSERT INTO `folios_apartados` (`id`, `sucursal_id`, `folio`, `ruta_pdf`, `usuario_propietario_id`, `estatus_folio_id`, `created_at`, `updated_at`, `creado_por_usuario_id`, `actualizado_por_usuario_id`) VALUES
(8, 4, 'GDL-ZEN-0001', 'recibos_apartado/recibo-apartado-GDL-ZEN-0001.pdf', 4, 1, '2025-07-19 19:21:16', '2025-07-19 19:21:17', 4, 4),
(9, 4, 'GDL-ZEN-0002', 'recibos_apartado/recibo-apartado-GDL-ZEN-0002.pdf', 1, 1, '2025-08-13 20:24:59', '2025-08-13 20:24:59', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos_propiedades`
--

CREATE TABLE `fotos_propiedades` (
  `id` int(11) NOT NULL,
  `propiedad_id` int(11) NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `nombre_archivo` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por_usuario_id` int(11) NOT NULL,
  `actualizado_por_usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `fotos_propiedades`
--

INSERT INTO `fotos_propiedades` (`id`, `propiedad_id`, `ruta_archivo`, `nombre_archivo`, `orden`, `descripcion`, `created_at`, `updated_at`, `creado_por_usuario_id`, `actualizado_por_usuario_id`) VALUES
(8, 14, '/uploads/propiedades/14/68609580a2a27-gorra.png', '68609580a2a27-gorra.png', 0, NULL, '2025-06-29 01:23:28', '2025-06-29 01:23:28', 1, NULL),
(9, 14, '/uploads/propiedades/14/6860958453593-sheepy6.png', '6860958453593-sheepy6.png', 0, NULL, '2025-06-29 01:23:28', '2025-06-29 01:23:28', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `usuario_destinatario_id` int(11) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  `tipo_notificacion` varchar(50) NOT NULL COMMENT 'Ej: nueva_tarea, avance_proceso, evento_clave',
  `leida` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_leida` datetime DEFAULT NULL,
  `entidad_relacionada` varchar(50) DEFAULT NULL COMMENT 'Ej: proceso_venta, prospecto',
  `entidad_id` int(11) DEFAULT NULL,
  `url_destino` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `usuario_destinatario_id`, `mensaje`, `tipo_notificacion`, `leida`, `fecha_leida`, `entidad_relacionada`, `entidad_id`, `url_destino`, `created_at`) VALUES
(1, 1, 'Se ha creado una nueva solicitud de contrato para el proceso de venta #10.', 'nueva_tarea', 0, '2025-08-06 02:25:30', 'proceso_venta', 10, '/procesos-venta/ver/10', '2025-08-04 08:12:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `proceso_venta_id` int(11) NOT NULL,
  `tipo_pago_id` int(11) NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  `metodo_pago` varchar(100) DEFAULT NULL,
  `referencia_pago` varchar(255) DEFAULT NULL,
  `documento_comprobante_id` int(11) NOT NULL,
  `estatus_validacion` enum('pendiente','aprobado','rechazado') NOT NULL DEFAULT 'pendiente',
  `validado_por_usuario_id` int(11) DEFAULT NULL,
  `fecha_validacion` datetime DEFAULT NULL,
  `notas_validacion` text DEFAULT NULL,
  `creado_por_usuario_id` int(11) DEFAULT NULL,
  `actualizado_por_usuario_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `proceso_venta_id`, `tipo_pago_id`, `monto`, `fecha_pago`, `metodo_pago`, `referencia_pago`, `documento_comprobante_id`, `estatus_validacion`, `validado_por_usuario_id`, `fecha_validacion`, `notas_validacion`, `creado_por_usuario_id`, `actualizado_por_usuario_id`, `created_at`, `updated_at`) VALUES
(2, 10, 1, 10000.00, '2025-07-26', NULL, NULL, 22, 'aprobado', 4, '2025-07-26 17:36:21', '', 4, 4, '2025-07-26 17:14:33', '2025-07-26 17:36:21'),
(3, 11, 1, 10000.00, '2025-08-13', NULL, NULL, 25, 'aprobado', 1, '2025-08-13 20:26:28', '', 1, 1, '2025-08-13 20:25:06', '2025-08-13 20:26:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_apartado`
--

CREATE TABLE `pagos_apartado` (
  `id` int(11) NOT NULL,
  `proceso_venta_id` int(11) NOT NULL,
  `documento_comprobante_id` int(11) NOT NULL,
  `monto` decimal(8,2) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `estatus_validacion` enum('pendiente','aprobado','rechazado') NOT NULL DEFAULT 'pendiente',
  `validado_por_usuario_id` int(11) DEFAULT NULL,
  `fecha_validacion` datetime DEFAULT NULL,
  `creado_por_usuario_id` int(11) NOT NULL,
  `actualizado_por_usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagos_apartado`
--

INSERT INTO `pagos_apartado` (`id`, `proceso_venta_id`, `documento_comprobante_id`, `monto`, `fecha_pago`, `estatus_validacion`, `validado_por_usuario_id`, `fecha_validacion`, `creado_por_usuario_id`, `actualizado_por_usuario_id`) VALUES
(4, 10, 19, 10000.00, '2025-07-19 21:57:03', 'pendiente', NULL, NULL, 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesos_venta`
--

CREATE TABLE `procesos_venta` (
  `id` int(11) NOT NULL,
  `prospecto_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `propiedad_id` int(11) NOT NULL,
  `estatus_proceso_id` int(11) NOT NULL,
  `usuario_responsable_id` int(11) NOT NULL,
  `folio_apartado` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: Activo, 0: Cerrado/Cancelado',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `procesos_venta`
--

INSERT INTO `procesos_venta` (`id`, `prospecto_id`, `cliente_id`, `propiedad_id`, `estatus_proceso_id`, `usuario_responsable_id`, `folio_apartado`, `is_active`, `created_at`, `updated_at`) VALUES
(10, 9, 4, 14, 8, 4, 'GDL-ZEN-0001', 1, '2025-07-19 19:06:05', '2025-08-02 16:38:36'),
(11, 11, 5, 15, 9, 1, 'GDL-ZEN-0002', 1, '2025-08-13 20:14:52', '2025-08-13 20:42:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso_cambio_r3`
--

CREATE TABLE `proceso_cambio_r3` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `propiedad_original_id` int(11) NOT NULL,
  `propiedad_ofrecida_id` int(11) DEFAULT NULL,
  `fecha_oferta` date NOT NULL,
  `estatus_proceso` enum('Ofrecida','Aceptada','Rechazada','Completada R3','Cancelada') NOT NULL DEFAULT 'Ofrecida',
  `usuario_responsable_id` int(11) NOT NULL,
  `comentarios` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proceso_cambio_r3`
--

INSERT INTO `proceso_cambio_r3` (`id`, `cliente_id`, `propiedad_original_id`, `propiedad_ofrecida_id`, `fecha_oferta`, `estatus_proceso`, `usuario_responsable_id`, `comentarios`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 5, '2025-05-15', 'Ofrecida', 2, 'Oferta de Propiedad 5 a Cliente 1 (R1).', '2025-05-24 05:52:53', '2025-05-24 05:52:53'),
(2, 3, 8, 9, '2025-05-18', 'Completada R3', 1, 'Proceso de cambio completado para Cliente 3 con Propiedad 9.', '2025-05-24 05:52:53', '2025-05-24 05:52:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades`
--

CREATE TABLE `propiedades` (
  `id` int(11) NOT NULL,
  `cartera_id` int(11) NOT NULL COMMENT 'ID de la cartera (carteras).',
  `numero_credito` varchar(100) NOT NULL COMMENT 'Identificador de la garantía de la propiedad.',
  `direccion` varchar(300) NOT NULL COMMENT 'Dirección de la propiedad.',
  `direccion_extra` varchar(300) DEFAULT NULL COMMENT 'Información extra de la propiedad.',
  `fraccionamiento` varchar(255) DEFAULT NULL COMMENT 'Fraccionamiento de la propiedad si es que pertenece a uno.',
  `codigo_postal` varchar(10) NOT NULL COMMENT 'Codigo Postal de la propiedad',
  `estado_id` int(11) NOT NULL COMMENT 'ID del estado (cat_estados).',
  `municipio_id` int(11) NOT NULL COMMENT 'ID del municipio (cat_municipios).',
  `tipo_vivienda` varchar(100) DEFAULT NULL COMMENT 'Tipo de vivienda.',
  `tipo_inmueble` varchar(100) DEFAULT NULL COMMENT 'Tipo del inmueble.',
  `metros` decimal(8,2) DEFAULT NULL,
  `sucursal_id` int(11) NOT NULL COMMENT 'ID de la sucursal (cat_sucursales).',
  `administradora_id` int(11) NOT NULL COMMENT 'ID de la administradora (cat_administradoras).',
  `etapa_judicial` varchar(100) DEFAULT NULL COMMENT 'Dato de la etapa judicial de la propiedad.',
  `etapa_judicial_segunda` varchar(100) DEFAULT NULL COMMENT 'Dato para cuando hay una segunda etapa judicial en la propiedad.',
  `fecha_etapa_judicial` date DEFAULT NULL COMMENT 'Fecha de la última etapa judicial.',
  `tiempo_entrega` varchar(100) DEFAULT NULL COMMENT 'Tiempo de entrega de la propiedad.',
  `cofinavit` decimal(15,2) DEFAULT NULL COMMENT 'Cantidad de CONFINAVIT en caso de que tenga.',
  `avaluo_administradora` decimal(15,2) DEFAULT NULL COMMENT 'Avalúo dado por la administradora/banco.',
  `precio_lista` decimal(15,2) DEFAULT NULL COMMENT 'Precio dado por la administradora.',
  `precio_venta` decimal(15,2) DEFAULT NULL COMMENT 'Precio para la venta.',
  `tipo_propietario_id` int(11) DEFAULT NULL COMMENT 'Campo para saber si la propiedad pertenece a una administradora o ya es propia la garantía.',
  `tipo_documento_venta_id` int(11) DEFAULT NULL COMMENT ' 	Documento de venta, definido por el tipo de propietario. ',
  `comentarios_admin` text DEFAULT NULL COMMENT 'Comentarios hechos por usuarios (probablemente se pase a una tabla aparte).',
  `mapa_url` text DEFAULT NULL COMMENT 'URL de la ubicación de la propiedad en Maps.',
  `estatus_disponibilidad` enum('Disponible','Apartada','Vendida','En Proceso de Cambio','Retirada','En Proceso') NOT NULL DEFAULT 'Disponible' COMMENT 'Campo para conocer la disponibilidad facilmente.',
  `cliente_id` int(11) DEFAULT NULL COMMENT 'ID del cliente asignado a la garantía (clientes).',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por_usuario_id` int(11) NOT NULL,
  `actualizado_por_usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `propiedades`
--

INSERT INTO `propiedades` (`id`, `cartera_id`, `numero_credito`, `direccion`, `direccion_extra`, `fraccionamiento`, `codigo_postal`, `estado_id`, `municipio_id`, `tipo_vivienda`, `tipo_inmueble`, `metros`, `sucursal_id`, `administradora_id`, `etapa_judicial`, `etapa_judicial_segunda`, `fecha_etapa_judicial`, `tiempo_entrega`, `cofinavit`, `avaluo_administradora`, `precio_lista`, `precio_venta`, `tipo_propietario_id`, `tipo_documento_venta_id`, `comentarios_admin`, `mapa_url`, `estatus_disponibilidad`, `cliente_id`, `created_at`, `updated_at`, `creado_por_usuario_id`, `actualizado_por_usuario_id`) VALUES
(14, 4, '217001541', 'C AV PUERTO BAJANIA 1600  13 13 30   PARQUES DE COLON 00611 TLAQUEPAQUE JALISCO 45608', '', '', '45608', 14, 629, 'Casa vieja', 'Departamento', 20.00, 4, 1, 'EMPLAZAMIENTO', '', '2025-06-03', NULL, 1000.00, NULL, 747866.00, 800000.00, NULL, NULL, NULL, 'https://maps.app.goo.gl/8Cunp6fKTCYCuqaVA', 'En Proceso', NULL, '2025-06-29 01:23:28', '2025-07-19 19:06:05', 1, NULL),
(15, 4, '217001725', 'C ORCA 104  7A K   GAVIOTAS 00598 PUERTO VALLARTA JALISCO 48328', '', '', '48328', 14, 598, 'Nuevo', 'Apartamento', NULL, 4, 1, 'INTERRUPCIÓN PRESCRIPCIÓN SENTENCIA', '', '2025-05-15', NULL, NULL, 600000.00, 784020.00, 800000.00, NULL, NULL, NULL, '', 'En Proceso', NULL, '2025-08-13 20:07:08', '2025-08-13 20:14:52', 1, NULL),
(16, 4, '215000222', 'RETORNO DE LOS HALCONES104104 EL PALOMAR SECCION BALCONE S00630 TLAJOMULCO DE ZUNIGA45643STMJL', '', '', '45643', 14, 628, 'Mediana', 'Apartamento', NULL, 4, 1, 'PRESENTACION DE DEMANDA', '', '2025-08-13', NULL, NULL, 600500.00, 841508.00, 841508.00, NULL, NULL, NULL, 'https://maps.app.goo.gl/8Cunp6fKTCYCuqaVA', 'Disponible', NULL, '2025-08-13 21:13:52', '2025-08-13 21:13:52', 1, NULL),
(17, 4, '217001541', 'C AV PUERTO BAJANIA 1900  13 13 30   PARQUES DE COLON 00611 TLAQUEPAQUE JALISCO 45608', '', '', '45608', 14, 629, 'Nueva', '', 20.00, 3, 6, 'EMPLAZAMIENTO', '', '2025-08-16', NULL, 1000.00, 747866.00, 747866.00, 747866.00, NULL, NULL, NULL, 'https://maps.app.goo.gl/8Cunp6fKTCYCuqaVA', 'Disponible', NULL, '2025-08-16 17:47:04', '2025-08-16 17:47:04', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades_revision`
--

CREATE TABLE `propiedades_revision` (
  `id` int(11) NOT NULL,
  `cartera_id` int(11) NOT NULL COMMENT 'ID de la cartera (carteras).',
  `numero_credito` varchar(100) NOT NULL COMMENT 'Identificador de la garantía de la propiedad.',
  `direccion` varchar(300) NOT NULL COMMENT 'Dirección de la propiedad.',
  `direccion_extra` varchar(300) DEFAULT NULL COMMENT 'Información extra de la propiedad.',
  `fraccionamiento` varchar(255) DEFAULT NULL COMMENT 'Fraccionamiento de la propiedad si es que pertenece a uno.',
  `codigo_postal` varchar(10) NOT NULL COMMENT 'Codigo Postal de la propiedad',
  `estado` varchar(100) NOT NULL COMMENT 'Nombre del estado cargado de archivo.',
  `municipio` varchar(100) NOT NULL COMMENT 'Nombre de municipio cargado del archivo.',
  `tipo_vivienda` varchar(100) DEFAULT NULL COMMENT 'Tipo de vivienda.',
  `tipo_inmueble` varchar(100) DEFAULT NULL COMMENT 'Tipo del inmueble.',
  `metros` varchar(50) DEFAULT NULL,
  `sucursal_id` int(11) NOT NULL COMMENT 'ID de la sucursal (cat_sucursales).',
  `administradora_id` int(11) NOT NULL COMMENT 'ID de la administradora (cat_administradoras).',
  `etapa_judicial` varchar(100) DEFAULT NULL COMMENT 'Dato de la etapa judicial de la propiedad.',
  `etapa_judicial_segunda` varchar(100) DEFAULT NULL COMMENT 'Dato para cuando hay una segunda etapa judicial en la propiedad.',
  `fecha_etapa_judicial` varchar(100) DEFAULT NULL COMMENT 'Fecha de la última etapa judicial.',
  `cofinavit` decimal(15,2) DEFAULT NULL,
  `avaluo_administradora` decimal(15,2) DEFAULT NULL,
  `precio_lista` decimal(15,2) DEFAULT NULL COMMENT 'Precio dado por la administradora.',
  `estatus` enum('Pendiente','Validado','Rechazado','') NOT NULL DEFAULT 'Pendiente',
  `propiedad_final_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por_usuario_id` int(11) NOT NULL,
  `actualizado_por_usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `propiedades_revision`
--

INSERT INTO `propiedades_revision` (`id`, `cartera_id`, `numero_credito`, `direccion`, `direccion_extra`, `fraccionamiento`, `codigo_postal`, `estado`, `municipio`, `tipo_vivienda`, `tipo_inmueble`, `metros`, `sucursal_id`, `administradora_id`, `etapa_judicial`, `etapa_judicial_segunda`, `fecha_etapa_judicial`, `cofinavit`, `avaluo_administradora`, `precio_lista`, `estatus`, `propiedad_final_id`, `created_at`, `updated_at`, `creado_por_usuario_id`, `actualizado_por_usuario_id`) VALUES
(4, 4, '215000222', 'RETORNO DE LOS HALCONES104104 EL PALOMAR SECCION BALCONE S00630 TLAJOMULCO DE ZUNIGA45643STMJL', NULL, NULL, '45643', 'JALISCO', 'TLAJOMULCO DE ZUNIGA', 'Mediana', NULL, NULL, 4, 1, 'PRESENTACION DE DEMANDA', NULL, NULL, NULL, 600500.00, 841508.00, 'Validado', 16, '2025-06-29 01:19:00', '2025-08-13 21:13:52', 1, NULL),
(5, 4, '217001725', 'C ORCA 104  7A K   GAVIOTAS 00598 PUERTO VALLARTA JALISCO 48328', NULL, NULL, '48328', 'JALISCO', 'PUERTO VALLARTA', NULL, 'Apartamento', NULL, 4, 1, 'INTERRUPCIÓN PRESCRIPCIÓN SENTENCIA', NULL, '15/05/2025', NULL, NULL, 784020.00, 'Validado', 15, '2025-06-29 01:19:00', '2025-08-13 20:07:08', 1, NULL),
(6, 4, '217001541', 'C AV PUERTO BAJANIA 1600  13 13 30   PARQUES DE COLON 00611 TLAQUEPAQUE JALISCO 45608', NULL, NULL, '45608', 'JALISCO', 'TLAQUEPAQUE', NULL, NULL, '20', 4, 1, 'EMPLAZAMIENTO', NULL, NULL, 1000.00, NULL, 747866.00, 'Validado', 14, '2025-06-29 01:19:00', '2025-06-29 01:23:28', 1, NULL),
(7, 4, '215000222', 'RETORNO DE LOS HALCONES104104 EL PALOMAR SECCION BALCONE S00630 TLAJOMULCO DE ZUNIGA45643STMJL', NULL, NULL, '45643', 'JALISCO', 'TLAJOMULCO DE ZUNIGA', 'Mediana', NULL, NULL, 3, 6, 'PRESENTACION DE DEMANDA', NULL, NULL, NULL, 600500.00, 841508.00, 'Pendiente', NULL, '2025-08-16 17:39:35', '2025-08-16 17:39:35', 1, NULL),
(8, 4, '217001725', 'C ORCA 104  7A K   GAVIOTAS 00598 PUERTO VALLARTA JALISCO 48328', NULL, NULL, '48328', 'JALISCO', 'PUERTO VALLARTA', NULL, 'Apartamento', NULL, 3, 6, 'INTERRUPCIÓN PRESCRIPCIÓN SENTENCIA', NULL, '15/05/2025', NULL, NULL, 784020.00, 'Pendiente', NULL, '2025-08-16 17:39:35', '2025-08-16 17:39:35', 1, NULL),
(9, 4, '217001541', 'C AV PUERTO BAJANIA 1600  13 13 30   PARQUES DE COLON 00611 TLAQUEPAQUE JALISCO 45608', NULL, NULL, '45608', 'JALISCO', 'TLAQUEPAQUE', NULL, NULL, '20', 3, 6, 'EMPLAZAMIENTO', NULL, NULL, 1000.00, NULL, 747866.00, 'Validado', 17, '2025-08-16 17:39:35', '2025-08-16 17:47:04', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prospectos`
--

CREATE TABLE `prospectos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `usuario_responsable_id` int(11) NOT NULL,
  `sucursal_id` int(11) NOT NULL,
  `dial_code` varchar(5) DEFAULT NULL,
  `pais_code` varchar(5) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `estatus_global_id` int(11) NOT NULL DEFAULT 1,
  `estatus_prospecto` varchar(50) NOT NULL DEFAULT 'nuevo',
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `prospectos`
--

INSERT INTO `prospectos` (`id`, `nombre`, `celular`, `email`, `usuario_responsable_id`, `sucursal_id`, `dial_code`, `pais_code`, `cliente_id`, `estatus_global_id`, `estatus_prospecto`, `activo`, `created_at`, `updated_at`) VALUES
(7, 'Juan Pérez', '3333333333', 'juan@mail.com', 4, 4, '52', 'MX', NULL, 1, 'nuevo', 0, '2025-07-19 18:40:44', '2025-07-19 18:45:39'),
(9, 'Juan Pérez 2', '3333333333', 'juan2@mail.com', 4, 4, '52', 'MX', 4, 4, 'nuevo', 1, '2025-07-19 18:48:11', '2025-07-26 17:36:21'),
(10, 'Prueba', '3333333333', 'test@mail.com', 4, 4, '52', 'MX', NULL, 1, 'nuevo', 0, '2025-07-26 04:08:44', '2025-07-26 04:08:56'),
(11, 'María', 'Savala', 'maria@mail.com', 1, 4, '52', 'MX', 5, 4, 'nuevo', 1, '2025-08-13 20:10:55', '2025-08-13 20:26:28'),
(12, 'Luis', '3322408393', 'luis@digitalsheep.dev', 1, 4, '52', 'MX', NULL, 1, 'nuevo', 1, '2025-08-13 21:14:57', '2025-08-13 21:14:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permiso`
--

CREATE TABLE `rol_permiso` (
  `rol_id` int(11) NOT NULL,
  `permiso_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rol_permiso`
--

INSERT INTO `rol_permiso` (`rol_id`, `permiso_id`, `created_at`) VALUES
(1, 1, '2025-08-06 02:16:00'),
(1, 2, '2025-08-06 02:16:00'),
(1, 3, '2025-08-06 02:16:00'),
(1, 4, '2025-08-06 02:16:00'),
(1, 5, '2025-08-06 02:16:00'),
(1, 6, '2025-08-06 02:16:00'),
(1, 7, '2025-08-06 02:16:00'),
(1, 8, '2025-08-06 02:16:00'),
(1, 9, '2025-08-06 02:16:00'),
(1, 11, '2025-08-06 02:16:00'),
(1, 12, '2025-08-06 02:16:00'),
(1, 13, '2025-08-06 02:16:00'),
(1, 14, '2025-08-06 02:16:00'),
(1, 15, '2025-08-06 02:16:00'),
(1, 16, '2025-08-06 02:16:00'),
(1, 17, '2025-08-06 02:16:00'),
(1, 18, '2025-08-06 02:16:00'),
(1, 19, '2025-08-06 02:16:00'),
(1, 20, '2025-08-06 02:16:00'),
(1, 21, '2025-08-06 02:16:00'),
(1, 22, '2025-08-06 02:16:00'),
(1, 23, '2025-08-06 02:16:00'),
(1, 24, '2025-08-06 02:16:00'),
(1, 25, '2025-08-06 02:16:00'),
(1, 26, '2025-08-06 02:16:00'),
(1, 27, '2025-08-06 02:16:00'),
(1, 29, '2025-08-06 02:16:00'),
(1, 30, '2025-08-06 02:16:00'),
(1, 31, '2025-08-06 02:16:00'),
(1, 32, '2025-08-06 02:16:00'),
(1, 33, '2025-08-06 02:16:00'),
(1, 34, '2025-08-06 02:16:00'),
(1, 35, '2025-08-06 02:16:00'),
(1, 36, '2025-08-06 02:16:00'),
(1, 37, '2025-08-06 02:16:00'),
(1, 38, '2025-08-06 02:16:00'),
(1, 39, '2025-08-06 02:16:00'),
(1, 40, '2025-08-06 02:16:00'),
(1, 41, '2025-08-06 02:16:00'),
(1, 42, '2025-08-06 02:16:00'),
(1, 43, '2025-08-06 02:16:00'),
(1, 44, '2025-08-06 02:16:00'),
(1, 45, '2025-08-06 02:16:00'),
(1, 46, '2025-08-06 02:16:00'),
(1, 47, '2025-08-06 02:16:00'),
(1, 48, '2025-08-06 02:16:00'),
(1, 49, '2025-08-06 02:16:00'),
(1, 50, '2025-08-06 02:16:00'),
(1, 51, '2025-08-06 02:16:00'),
(1, 52, '2025-08-06 02:16:00'),
(1, 53, '2025-08-06 02:16:00'),
(1, 55, '2025-08-06 02:16:00'),
(1, 57, '2025-08-06 02:16:00'),
(1, 58, '2025-08-06 02:16:00'),
(1, 59, '2025-08-06 02:16:00'),
(1, 60, '2025-08-06 02:16:00'),
(1, 61, '2025-08-06 02:16:00'),
(8, 7, '2025-07-19 18:08:02'),
(8, 40, '2025-07-19 18:08:02'),
(8, 41, '2025-07-19 18:08:02'),
(8, 42, '2025-07-19 18:08:02'),
(8, 43, '2025-07-19 18:08:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimientos_prospectos_clientes`
--

CREATE TABLE `seguimientos_prospectos_clientes` (
  `id` int(11) NOT NULL,
  `proceso_venta_id` int(11) DEFAULT NULL,
  `tipo_interaccion` enum('llamada','cita','email','nota','visita_propiedad','oferta_propiedad_r3') NOT NULL,
  `fecha_interaccion` datetime NOT NULL,
  `usuario_registra_id` int(11) NOT NULL,
  `comentarios` text DEFAULT NULL,
  `resultado` varchar(100) DEFAULT NULL,
  `duracion_minutos` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `seguimientos_prospectos_clientes`
--

INSERT INTO `seguimientos_prospectos_clientes` (`id`, `proceso_venta_id`, `tipo_interaccion`, `fecha_interaccion`, `usuario_registra_id`, `comentarios`, `resultado`, `duracion_minutos`, `created_at`, `updated_at`) VALUES
(3, 10, 'llamada', '2025-07-19 19:19:51', 4, 'Llamé al prospecto para agendar una cita para visitar la propiedad.', NULL, NULL, '2025-07-19 19:19:51', '2025-07-19 19:19:51'),
(4, 10, 'cita', '2025-07-19 19:20:12', 4, 'Tuve una cita con el prospecto para aclarar dudas.', NULL, NULL, '2025-07-19 19:20:12', '2025-07-19 19:20:12'),
(5, 10, 'visita_propiedad', '2025-07-19 19:20:36', 4, 'Visitamos la propiedad.', NULL, NULL, '2025-07-19 19:20:36', '2025-07-19 19:20:36'),
(6, 10, 'email', '2025-07-22 02:39:51', 1, 'Se le mandó un email para información', NULL, NULL, '2025-07-22 02:39:51', '2025-07-22 02:39:51'),
(7, 11, 'cita', '2025-08-13 20:22:27', 1, 'Se logró agendar una cita', 'Cita Agendada', NULL, '2025-08-13 20:22:27', '2025-08-13 20:22:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_contrato`
--

CREATE TABLE `solicitudes_contrato` (
  `id` int(11) NOT NULL,
  `proceso_venta_id` int(11) NOT NULL,
  `solicitado_por_usuario_id` int(11) NOT NULL,
  `asignado_a_usuario_id` int(11) DEFAULT NULL,
  `estatus_solicitud` enum('pendiente','en_proceso','en_validacion','completado','rechazado') NOT NULL DEFAULT 'pendiente',
  `ruta_contrato_final` varchar(255) DEFAULT NULL,
  `notas_solicitud` text DEFAULT NULL,
  `fecha_completado` datetime DEFAULT NULL,
  `creado_por_usuario_id` int(11) DEFAULT NULL,
  `actualizado_por_usuario_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `solicitudes_contrato`
--

INSERT INTO `solicitudes_contrato` (`id`, `proceso_venta_id`, `solicitado_por_usuario_id`, `asignado_a_usuario_id`, `estatus_solicitud`, `ruta_contrato_final`, `notas_solicitud`, `fecha_completado`, `creado_por_usuario_id`, `actualizado_por_usuario_id`, `created_at`, `updated_at`) VALUES
(1, 10, 4, 4, 'en_proceso', 'contratos_finales/10/contrato_688e3f0caa192-GDL-ZEN-0001.pdf', NULL, '2025-08-02 16:38:36', 4, 4, '2025-07-26 20:39:34', '2025-08-06 02:18:01'),
(2, 11, 1, 1, 'completado', 'contratos_finales/11/contrato_689cf68b2f413-zeekr_marca.pdf', NULL, '2025-08-13 20:42:05', 1, 1, '2025-08-13 20:30:02', '2025-08-13 20:42:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `rol_id` int(11) NOT NULL,
  `sucursal_id` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por_usuario_id` int(11) NOT NULL,
  `actualizado_por_usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password_hash`, `telefono`, `avatar_url`, `rol_id`, `sucursal_id`, `activo`, `created_at`, `updated_at`, `creado_por_usuario_id`, `actualizado_por_usuario_id`) VALUES
(1, 'Erika España', 'erika.espana@diipadesarrollos.com', '$2y$12$y23FFe72NMY2d9Ax2RuivO2oe65elQyCZq.oT6E4FaISRWJG5DKk2', NULL, NULL, 1, 1, 1, '2025-05-21 04:16:10', '2025-07-17 07:11:58', 1, NULL),
(2, 'Luis Gerente MAZ', 'luis.gerente@inmuebles.com', '$2y$10$22n1.w2rE5p1pL1s4x1u.e2h4F1f1p4x1n1s5Z1q1w5B1f1p4x1n1s5Z1q1w5B1f1p4x1n1s5Z1q1w5B1f1p4x1n1s5Z1q1w5B', '3320002000', NULL, 4, 2, 1, '2025-05-24 05:47:06', '2025-07-17 07:12:00', 1, NULL),
(3, 'Ana Vendedor GDL', 'ana.vendedor@inmuebles.com', '$2y$10$22n1.w2rE5p1pL1s4x1u.e2h4F1f1p4x1n1s5Z1q1w5B1f1p4x1n1s5Z1q1w5B1f1p4x1n1s5Z1q1w5B1f1p4x1n1s5Z1q1w5B', '3330003000', NULL, 5, 4, 1, '2025-05-24 05:47:06', '2025-07-17 07:12:02', 1, NULL),
(4, 'Luis Peña', 'luis@digitalsheep.dev', '$2y$12$szXT03eqvb5nSAbuLWZHyeZPNyW3bZfwPVIKVdS.I4LA.gOSq0wCG', '3322408393', NULL, 1, 4, 1, '2025-07-19 18:00:37', '2025-07-19 18:01:09', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validaciones_proceso`
--

CREATE TABLE `validaciones_proceso` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `propiedad_id` int(11) DEFAULT NULL,
  `documento_id` int(11) DEFAULT NULL,
  `propiedad_asignacion_id` int(11) DEFAULT NULL,
  `tipo_validable` enum('pago_apartado','contrato','dictamen_propiedad','carga_cartera','cambio_r3') NOT NULL,
  `rol_validador_id` int(11) NOT NULL,
  `usuario_validador_id` int(11) DEFAULT NULL,
  `estatus_validacion` enum('pendiente','aprobado','rechazado') NOT NULL DEFAULT 'pendiente',
  `comentarios` text DEFAULT NULL,
  `fecha_validacion` timestamp NULL DEFAULT NULL,
  `fecha_limite` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carteras`
--
ALTER TABLE `carteras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_administradoras`
--
ALTER TABLE `cat_administradoras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_clasificacion_legal_propiedad`
--
ALTER TABLE `cat_clasificacion_legal_propiedad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `cat_estados`
--
ALTER TABLE `cat_estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_estados_civiles`
--
ALTER TABLE `cat_estados_civiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `cat_estatus_cliente`
--
ALTER TABLE `cat_estatus_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orden` (`orden`);

--
-- Indices de la tabla `cat_estatus_global_prospecto`
--
ALTER TABLE `cat_estatus_global_prospecto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_orden_unico` (`orden`);

--
-- Indices de la tabla `cat_estatus_juridico_propiedad`
--
ALTER TABLE `cat_estatus_juridico_propiedad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orden` (`orden`);

--
-- Indices de la tabla `cat_estatus_legal_cliente`
--
ALTER TABLE `cat_estatus_legal_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `cat_estatus_prospeccion`
--
ALTER TABLE `cat_estatus_prospeccion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orden` (`orden`);

--
-- Indices de la tabla `cat_municipios`
--
ALTER TABLE `cat_municipios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_paises`
--
ALTER TABLE `cat_paises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `cat_permisos`
--
ALTER TABLE `cat_permisos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `cat_resultados_seguimiento`
--
ALTER TABLE `cat_resultados_seguimiento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `cat_roles`
--
ALTER TABLE `cat_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `cat_sucursales`
--
ALTER TABLE `cat_sucursales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `abreviatura` (`abreviatura`);

--
-- Indices de la tabla `cat_tipos_documento_cliente`
--
ALTER TABLE `cat_tipos_documento_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `cat_tipos_documento_venta`
--
ALTER TABLE `cat_tipos_documento_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tipos_documento_venta_tipo_propietario_id` (`tipo_propietario_id`);

--
-- Indices de la tabla `cat_tipos_evento_agenda`
--
ALTER TABLE `cat_tipos_evento_agenda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `cat_tipos_pago`
--
ALTER TABLE `cat_tipos_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cat_tipos_propietario`
--
ALTER TABLE `cat_tipos_propietario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `curp` (`curp`),
  ADD UNIQUE KEY `rfc` (`rfc`),
  ADD KEY `idx_clientes_estado_id` (`estado_id`),
  ADD KEY `idx_clientes_municipio_id` (`municipio_id`),
  ADD KEY `idx_clientes_sucursal_id` (`sucursal_id`),
  ADD KEY `idx_clientes_usuario_propietario_id` (`usuario_responsable_id`),
  ADD KEY `idx_clientes_folio_id` (`folio_id`);

--
-- Indices de la tabla `contrato_validaciones`
--
ALTER TABLE `contrato_validaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dictamenes_juridicos`
--
ALTER TABLE `dictamenes_juridicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `documentos_clientes`
--
ALTER TABLE `documentos_clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_documentos_prospecto_id` (`prospecto_id`);

--
-- Indices de la tabla `eventos_agenda`
--
ALTER TABLE `eventos_agenda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `folios_apartados`
--
ALTER TABLE `folios_apartados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `folio` (`folio`),
  ADD KEY `idx_folios_propiedad_sucursal_id` (`sucursal_id`),
  ADD KEY `idx_folios_propiedad_usuario_propietario_id` (`usuario_propietario_id`);

--
-- Indices de la tabla `fotos_propiedades`
--
ALTER TABLE `fotos_propiedades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos_apartado`
--
ALTER TABLE `pagos_apartado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `procesos_venta`
--
ALTER TABLE `procesos_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_proceso_prospecto_id` (`prospecto_id`),
  ADD KEY `idx_proceso_cliente_id` (`cliente_id`),
  ADD KEY `idx_proceso_propiedad_id` (`propiedad_id`),
  ADD KEY `idx_proceso_estatus_id` (`estatus_proceso_id`),
  ADD KEY `idx_proceso_responsable_id` (`usuario_responsable_id`);

--
-- Indices de la tabla `proceso_cambio_r3`
--
ALTER TABLE `proceso_cambio_r3`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_propiedades_estado_id` (`estado_id`),
  ADD KEY `fk_propiedades_sucursal_id` (`sucursal_id`),
  ADD KEY `fk_propiedades_banco_id` (`administradora_id`),
  ADD KEY `fk_propiedades_municipio_id` (`municipio_id`);

--
-- Indices de la tabla `propiedades_revision`
--
ALTER TABLE `propiedades_revision`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_propiedades_sucursal_id` (`sucursal_id`),
  ADD KEY `fk_propiedades_banco_id` (`administradora_id`);

--
-- Indices de la tabla `prospectos`
--
ALTER TABLE `prospectos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_prospectos_usuario_responsable_id` (`usuario_responsable_id`),
  ADD KEY `fk_prospectos_sucursal_id` (`sucursal_id`),
  ADD KEY `fk_prospectos_cliente_id` (`cliente_id`),
  ADD KEY `idx_prospecto_estatus_global_id` (`estatus_global_id`);

--
-- Indices de la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD PRIMARY KEY (`rol_id`,`permiso_id`);

--
-- Indices de la tabla `seguimientos_prospectos_clientes`
--
ALTER TABLE `seguimientos_prospectos_clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitudes_contrato`
--
ALTER TABLE `solicitudes_contrato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_usuarios_rol_id` (`rol_id`),
  ADD KEY `idx_usuarios_sucursal_id` (`sucursal_id`);

--
-- Indices de la tabla `validaciones_proceso`
--
ALTER TABLE `validaciones_proceso`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carteras`
--
ALTER TABLE `carteras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cat_administradoras`
--
ALTER TABLE `cat_administradoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `cat_clasificacion_legal_propiedad`
--
ALTER TABLE `cat_clasificacion_legal_propiedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cat_estados`
--
ALTER TABLE `cat_estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `cat_estados_civiles`
--
ALTER TABLE `cat_estados_civiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cat_estatus_cliente`
--
ALTER TABLE `cat_estatus_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cat_estatus_global_prospecto`
--
ALTER TABLE `cat_estatus_global_prospecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cat_estatus_juridico_propiedad`
--
ALTER TABLE `cat_estatus_juridico_propiedad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cat_estatus_legal_cliente`
--
ALTER TABLE `cat_estatus_legal_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cat_estatus_prospeccion`
--
ALTER TABLE `cat_estatus_prospeccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cat_municipios`
--
ALTER TABLE `cat_municipios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2458;

--
-- AUTO_INCREMENT de la tabla `cat_paises`
--
ALTER TABLE `cat_paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cat_permisos`
--
ALTER TABLE `cat_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `cat_resultados_seguimiento`
--
ALTER TABLE `cat_resultados_seguimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cat_roles`
--
ALTER TABLE `cat_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cat_sucursales`
--
ALTER TABLE `cat_sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cat_tipos_documento_cliente`
--
ALTER TABLE `cat_tipos_documento_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cat_tipos_documento_venta`
--
ALTER TABLE `cat_tipos_documento_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cat_tipos_evento_agenda`
--
ALTER TABLE `cat_tipos_evento_agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cat_tipos_pago`
--
ALTER TABLE `cat_tipos_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cat_tipos_propietario`
--
ALTER TABLE `cat_tipos_propietario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `contrato_validaciones`
--
ALTER TABLE `contrato_validaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `dictamenes_juridicos`
--
ALTER TABLE `dictamenes_juridicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `documentos_clientes`
--
ALTER TABLE `documentos_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `eventos_agenda`
--
ALTER TABLE `eventos_agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `folios_apartados`
--
ALTER TABLE `folios_apartados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `fotos_propiedades`
--
ALTER TABLE `fotos_propiedades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pagos_apartado`
--
ALTER TABLE `pagos_apartado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `procesos_venta`
--
ALTER TABLE `procesos_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `proceso_cambio_r3`
--
ALTER TABLE `proceso_cambio_r3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `propiedades_revision`
--
ALTER TABLE `propiedades_revision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `prospectos`
--
ALTER TABLE `prospectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `seguimientos_prospectos_clientes`
--
ALTER TABLE `seguimientos_prospectos_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `solicitudes_contrato`
--
ALTER TABLE `solicitudes_contrato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `validaciones_proceso`
--
ALTER TABLE `validaciones_proceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cat_tipos_documento_venta`
--
ALTER TABLE `cat_tipos_documento_venta`
  ADD CONSTRAINT `fk_tipos_documento_venta_tipo_propietario_id` FOREIGN KEY (`tipo_propietario_id`) REFERENCES `cat_tipos_propietario` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `cat_estados` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_clientes_folio_id` FOREIGN KEY (`folio_id`) REFERENCES `folios_apartados` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_clientes_municipio_id` FOREIGN KEY (`municipio_id`) REFERENCES `cat_municipios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_clientes_sucursal_id` FOREIGN KEY (`sucursal_id`) REFERENCES `cat_sucursales` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_clientes_usuario_propietario_id` FOREIGN KEY (`usuario_responsable_id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `folios_apartados`
--
ALTER TABLE `folios_apartados`
  ADD CONSTRAINT `fk_folios_propiedad_sucursal_id` FOREIGN KEY (`sucursal_id`) REFERENCES `cat_sucursales` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_folios_propiedad_usuario_propietario_id` FOREIGN KEY (`usuario_propietario_id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `procesos_venta`
--
ALTER TABLE `procesos_venta`
  ADD CONSTRAINT `fk_proceso_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_proceso_estatus` FOREIGN KEY (`estatus_proceso_id`) REFERENCES `cat_estatus_prospeccion` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_proceso_propiedad` FOREIGN KEY (`propiedad_id`) REFERENCES `propiedades` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_proceso_prospecto` FOREIGN KEY (`prospecto_id`) REFERENCES `prospectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_proceso_usuario` FOREIGN KEY (`usuario_responsable_id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `propiedades`
--
ALTER TABLE `propiedades`
  ADD CONSTRAINT `fk_propiedades_banco_id` FOREIGN KEY (`administradora_id`) REFERENCES `cat_administradoras` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_propiedades_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `cat_estados` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_propiedades_municipio_id` FOREIGN KEY (`municipio_id`) REFERENCES `cat_municipios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_propiedades_sucursal_id` FOREIGN KEY (`sucursal_id`) REFERENCES `cat_sucursales` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `prospectos`
--
ALTER TABLE `prospectos`
  ADD CONSTRAINT `fk_prospecto_estatus_global` FOREIGN KEY (`estatus_global_id`) REFERENCES `cat_estatus_global_prospecto` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prospectos_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prospectos_sucursal_id` FOREIGN KEY (`sucursal_id`) REFERENCES `cat_sucursales` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prospectos_usuario_responsable_id` FOREIGN KEY (`usuario_responsable_id`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_rol_id` FOREIGN KEY (`rol_id`) REFERENCES `cat_roles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuarios_sucursal_id` FOREIGN KEY (`sucursal_id`) REFERENCES `cat_sucursales` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

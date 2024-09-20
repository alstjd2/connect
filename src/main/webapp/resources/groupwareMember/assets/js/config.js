/**
 * Config
 * -------------------------------------------------------------------------------------
 * ! 중요: 템플릿에서 구성 변경 사항을 보려면 브라우저 로컬 스토리지를 지워야 합니다.
 * ! 로컬 저장소를 지우려면: (https://www.leadshook.com/help/how-to-clear-local-storage-in-google-chrome-browser/) .
 */

'use strict';


// JS global variables
window.config = {
  colors: {
    primary: '#696cff',
    secondary: '#8592a3',
    success: '#71dd37',
    info: '#03c3ec',
    warning: '#ffab00',
    danger: '#ff3e1d',
    dark: '#233446',
    black: '#22303e',
    white: '#fff',
    cardColor: '#fff',
    bodyBg: '#f5f5f9',
    bodyColor: '#646E78',
    headingColor: '#384551',
    textMuted: '#a7acb2',
    borderColor: '#e4e6e8'
  },
  colors_label: {
    primary: '#696cff29',
    secondary: '#8592a329',
    success: '#71dd3729',
    info: '#03c3ec29',
    warning: '#ffab0029',
    danger: '#ff3e1d29',
    dark: '#181c211a'
  },
  colors_dark: {
    cardColor: '#2b2c40',
    bodyBg: '#232333',
    bodyColor: '#b2b2c4',
    headingColor: '#d5d5e2',
    textMuted: '#7e7f96',
    borderColor: '#4e4f6c'
  },
  enableMenuLocalStorage: true // 로컬 스토리지 지원을 통해 메뉴 상태 사용
};

window.assetsPath = document.documentElement.getAttribute('data-assets-path');
window.templateName = document.documentElement.getAttribute('data-template');
window.rtlSupport = true; // rtl 지원(rtl + ltr)의 경우 true, ltr의 경우 false로 설정합니다.
const themes = parseInt(document.documentElement.getAttribute('data-themes'));
/**
 * 템플릿 커스터마이저
 * ! TemplateCustomizer 설정을 사용하려면 template-customizer.js를 사용해야 합니다
 * -----------------------------------------------------------------------------------------------
 */

// 더 많은 테마를 사용하려면 테마 개체로 밀어 넣기만 하면 됩니다.

/* TemplateCustomizer.THEMES.push({
  name: 'theme-raspberry',
  title: 'Raspberry'
}); */

// To add more languages, just push it to LANGUAGES object.

TemplateCustomizer.LANGUAGES.ko = { };


/**
 * TemplateCustomizer settings
 * -------------------------------------------------------------------------------------
 * cssPath: Core CSS file path
 * themesPath: Theme CSS file path
 * displayCustomizer: true(Show customizer), false(Hide customizer)
 * lang: To set default language, Add more langues and set default. Fallback language is 'en'
 * controls: [ 'rtl', 'style', 'headerType', 'contentLayout', 'layoutCollapsed', 'layoutNavbarOptions', 'themes' ] | Show/Hide customizer controls
 * defaultTheme: 0(Default), 1(Bordered), 2(Semi Dark)
 * defaultStyle: 'light', 'dark', 'system' (Mode)
 * defaultTextDir: 'ltr', 'rtl' (rtlSupport must be true for rtl mode)
 * defaultContentLayout: 'compact', 'wide' (compact=container-xxl, wide=container-fluid)
 * defaultHeaderType: 'static', 'fixed' (for horizontal layout only)
 * defaultMenuCollapsed: true, false (For vertical layout only)
 * defaultNavbarType: 'sticky', 'static', 'hidden' (For vertical layout only)
 * defaultFooterFixed: true, false (For vertical layout only)
 * defaultShowDropdownOnHover : true, false (for horizontal layout only)
 */

if (typeof TemplateCustomizer !== 'undefined') {
  window.templateCustomizer = new TemplateCustomizer({
    cssPath: assetsPath + 'vendor/css' + (rtlSupport ? '/rtl' : '') + '/',
    themesPath: assetsPath + 'vendor/css' + (rtlSupport ? '/rtl' : '') + '/',
    displayCustomizer: false,
    lang: localStorage.getItem('templateCustomizer-' + templateName + '--Lang') || 'ko', // Set default language here
    defaultTheme: themes,
    // defaultStyle: 'system',
    // defaultTextDir: 'rtl',
    // defaultContentLayout: 'wide',
    // defaultHeaderType: 'static',
    // defaultMenuCollapsed: true,
    // defaultNavbarType: 'sticky',
    // defaultFooterFixed: false,
    // defaultShowDropdownOnHover: false,
    controls: ['rtl', 'style', 'headerType', 'contentLayout', 'layoutCollapsed', 'layoutNavbarOptions', 'themes']
  });
}

import { defineStore } from 'pinia'
import { ref, watchEffect } from 'vue'

type Theme = 'light' | 'halloween'

export const useThemeStore = defineStore('theme', () => {
  const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches
  const theme = ref<Theme>(
    (localStorage.getItem('theme') as Theme) || (prefersDark ? 'halloween' : 'light'),
  )

  const toggleTheme = () => {
    const next = theme.value === 'light' ? 'halloween' : 'light'
    document.startViewTransition
      ? document.startViewTransition(() => (theme.value = next))
      : (theme.value = next)
  }

  watchEffect(() => {
    document.documentElement.setAttribute('data-theme', theme.value)
    localStorage.setItem('theme', theme.value)
  })

  return { theme, toggleTheme }
})

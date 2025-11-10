import type { Icon } from '@tabler/icons-vue'

export interface MenuItem {
  name: string
  icon: Icon
  link: string
  children?: MenuItem[]
}

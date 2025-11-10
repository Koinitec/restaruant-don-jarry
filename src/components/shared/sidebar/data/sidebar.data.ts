import type { MenuItem } from '../type/sidebar.interfaces'
import {
  IconHome2,
  IconBuildingWarehouse,
  IconReceipt2,
  IconBox,
  IconTicket,
  IconCashRegister,
  IconUserShield,
  IconChefHat,
  IconClipboardList,
  IconTruckDelivery,
  IconUsers,
} from '@tabler/icons-vue'

export const menuItems: MenuItem[] = [
  { name: 'Inicio', icon: IconHome2, link: '/' },
  {
    name: 'Admin',
    icon: IconUserShield,
    link: '/admin',
    children: [
      { name: 'Bodega', icon: IconBuildingWarehouse, link: '/admin/bodega' },
      { name: 'Inventario', icon: IconBox, link: '/admin/inventario' },
      { name: 'Ventas realizadas', icon: IconReceipt2, link: '/admin/ventas' },
      { name: 'Proveedores', icon: IconTruckDelivery, link: '/admin/proveedores' },
      { name: 'Usuarios', icon: IconUsers, link: '/admin/usuarios' },
    ],
  },
  {
    name: 'Vendedor',
    icon: IconTicket,
    link: '/vendedor',
    children: [
      { name: 'Venta de tickets', icon: IconTicket, link: '/vendedor/ventas' },
      { name: 'Apertura y Caja', icon: IconCashRegister, link: '/vendedor/caja' },
      { name: 'Pedidos en curso', icon: IconClipboardList, link: '/vendedor/pedidos' },
    ],
  },
  {
    name: 'Cocina',
    icon: IconChefHat,
    link: '/cocina',
    children: [
      { name: 'Pedidos pendientes', icon: IconClipboardList, link: '/cocina/pendientes' },
      { name: 'Pedidos completados', icon: IconReceipt2, link: '/cocina/completados' },
    ],
  },
]

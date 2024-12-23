// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "./application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import SidebarController from "./sidebar_controller"
application.register("sidebar", SidebarController)

import DropdownController from "./dropdown_controller"
application.register("dropdown", DropdownController)

import ScannerController from "./scanner_controller"
application.register("scanner", ScannerController)

import ValidationController from "./validation_controller"
application.register("validation", ValidationController)

project "GLFW"
	location "CustomEngine"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	
		includedirs {
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/glfw_config.h",
		"src/context.h",
		"src/init.h",
		"src/input.h",
		"src/monitor.h",
		"src/vulkan.h",
		"src/window.h"
	}

	filter "system:windows"
		buildoptions { "-std=c11", "-lgdi32" }
		systemversion "latest"
		staticruntime "on"
		
		files {
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c",
		}

		defines {
			"GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}
		
		filter { "system:windows", "configurations:Release" }
			buildoptions "/MT"
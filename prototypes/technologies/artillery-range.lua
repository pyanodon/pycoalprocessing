TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-1",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    order = "d-e-f"
  }

  TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-2",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery-shell-range-1'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    upgrade = true,
    order = "d-e-f"
  }

  TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-3",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery-shell-range-2'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    upgrade = true,
    order = "d-e-f"
  }

  TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-4",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery-shell-range-3'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    upgrade = true,
    order = "d-e-f"
  }

  TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-5",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery-shell-range-4'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    upgrade = true,
    order = "d-e-f"
  }

  TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-6",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery-shell-range-5'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    upgrade = true,
    order = "d-e-f"
  }

  TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-7",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery-shell-range-6'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    upgrade = true,
    order = "d-e-f"
  }

  TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-8",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery-shell-range-7'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    upgrade = true,
    order = "d-e-f"
  }

  TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-9",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery-shell-range-8'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    upgrade = true,
    order = "d-e-f"
  }

  TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-10",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery-shell-range-9'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    upgrade = true,
    order = "d-e-f"
  }

  TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-11",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery-shell-range-10'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    upgrade = true,
    order = "d-e-f"
  }

  TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-12",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery-shell-range-11'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    upgrade = true,
    order = "d-e-f"
  }

  TECHNOLOGY {
    type = "technology",
    name = "artillery-shell-range-13",
    icon_size = 256, icon_mipmaps = 4,
    icon = "__base__/graphics/technology/artillery.png",
    effects =
    {
      {
        type = "artillery-range",
        modifier = 0.3
      }
    },
    prerequisites = {'artillery-shell-range-12'},
    unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 30,
      count = 2000
    },
    upgrade = true,
    max_level = "infinite",
    order = "d-e-f"
  }
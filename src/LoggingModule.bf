using System;
using System.Collections;

namespace Steak.Logging
{
	public class LoggingModule
	{
		private readonly String mName ~ delete _;
		public StringView Name => mName;

		public List<ILogger> Loggers = new .() ~ delete _;

		private static List<LoggingModule> mModules = new .() ~ DeleteContainerAndItems!(_);

		public bool IsEnabled = true;

		public this(String name = Compiler.ProjectName)
		{
			mName = new .(name);
		}

		public void RegisterLogger(ILogger logger)
		{
			Loggers.Add(logger);
		}

		public void RemoveLogger(ILogger logger)
		{
			Loggers.Remove(logger);
		}

		public static LoggingModule Get(StringView name)
		{
			if (name.IsEmpty)
				return null;

			for (var module in mModules)
			{
				if (module.Name == name)
					return module;
			}

			return mModules.Add(.. new .(scope .(name)));
		}

		public static LoggingModule GetCurrent(String name = Compiler.ProjectName)
		{
			for (var module in mModules)
			{
				if (module.Name == name)
					return module;
			}

			return mModules.Add(.. new .());
		}
	}
}

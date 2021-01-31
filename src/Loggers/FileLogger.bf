using System;
using System.IO;

namespace Steak.Logging
{
	public class FileLogger	: StreamLogger
	{
		protected String mPath = new .() ~ delete _;
		protected FileStream mFileStream;

		public this(StringView path, StringView name = "", StringView format = "", LogLevel level = .Trace, String moduleName = Compiler.CallerProject) : base(new StreamWriter(new FileStream()..Open(path, .Append, .Write, .Read), .UTF8, 0, true), name, format, level, true, moduleName)
		{
			mPath.Set(path);
			mFileStream = (FileStream) Out.[Friend]mStream;
		}

		/// Open() is automatically called in the constructor
		public void Open()
		{
			mFileStream.Open(mPath, .Append, .Write, .Read);
		}

		public void Close()
		{
			mFileStream.Close();
		}

		public void Clear()
		{
			Close();
			File.WriteAllText(mPath, "");
			Open();
		}
	}
}

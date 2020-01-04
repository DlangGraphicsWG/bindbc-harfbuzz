module app;

import core.stdc.stdio : printf;

import loader = bindbc.loader;
import bindbc.hb;

int main(string[] args)
{
	version(BindHB_Static) {}
	else
	{
		HBSupport ret = loadHarfBuzz();
		if (ret != hbSupport)
		{
			if (ret == HBSupport.noLibrary)
			{
				printf("HarfBuzz library not found.\n");
				return 1;
			}
			else if (ret == HBSupport.badLibrary)
			{
				printf("%d\n", loadedHarfBuzzVersion);
				foreach(error; loader.errors)
					printf("%s\t%s\n", error.error, error.message);
				return 1;
			}
		}
		printf("Successfully loaded HarfBuzz library.\n");
	}
	
	import bindbc.hb.bind;
	printf("Harfbuzz version: %s\n", hb_version_string());
	
	version(BindHB_Static) {}
	else
	{
		size_t lastErrorCount = loader.errorCount;
		unloadHarfBuzz();
		if (loader.errorCount <= lastErrorCount)
			printf("Successfully unloaded HarfBuzz library.\n");
		else
		{
			printf("Failed to unload HarfBuzz library.\n");
			foreach(i; lastErrorCount .. loader.errorCount)
				printf("%s\t%s\n", loader.errors[i].error, loader.errors[i].message);
			return 1;
		}
	}
	
	return 0;
}
